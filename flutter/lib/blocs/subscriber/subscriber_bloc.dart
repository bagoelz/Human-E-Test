import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'subscriber_event.dart';
part 'subscriber_state.dart';

class SubscriberBloc extends Bloc<SubscriberEvent, SubscriberState> {
  SubscriberBloc() : super(SubscriberInitial()) {
    on<SubscriberEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
