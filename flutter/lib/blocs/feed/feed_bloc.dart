import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:feedsubscriber/models/feed.dart';
import 'package:feedsubscriber/repositories/feed_repositories.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedRepository feedRepository;
  StreamSubscription? feedSubscription;

  FeedBloc({required this.feedRepository}) : super(const FeedState()) {
    on<FeedFetched>(_mapLoadFeedToState);
  }

  Future<void> _mapLoadFeedToState(
      FeedFetched event, Emitter<FeedState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == FeedStatus.initial) {
        final List<Feeder> feeds = await feedRepository.getFeed();
        return emit(state.copyWith(
          status: FeedStatus.success,
          feeds: feeds,
          hasReachedMax: false,
        ));
      }
      final List<Feeder> feeds = await feedRepository.getFeed(state.feeds.length);
      emit(feeds.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: FeedStatus.success,
              feeds: List.of(state.feeds)..addAll(feeds),
              hasReachedMax: false,
            ));
    } catch (_) {
      emit(state.copyWith(status: FeedStatus.failure));
    }

    // Stream<FeedState> _mapUpdateFeedToState(UpdateFeed event) async* {
    //   yield FeedLoaded(feeder: event.feeder);
    // }

    @override
    Future<void> close() {
      feedSubscription?.cancel();
      return super.close();
    }
  }
}
