part of 'feed_bloc.dart';


enum FeedStatus { initial, success, failure }

class FeedState extends Equatable {
  const FeedState({
    this.status = FeedStatus.initial,
    this.feeds = const <Feeder>[],
    this.hasReachedMax = false,
  });

  final FeedStatus status;
  final List<Feeder> feeds;
  final bool hasReachedMax;

  FeedState copyWith({
    FeedStatus? status,
    List<Feeder>? feeds,
    bool? hasReachedMax,
  }) {
    return FeedState(
      status: status ?? this.status,
      feeds: feeds ?? this.feeds,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, hasReachedMax: $hasReachedMax, posts: ${feeds.length} }''';
  }

  @override
  List<Object> get props => [status, feeds, hasReachedMax];
}
