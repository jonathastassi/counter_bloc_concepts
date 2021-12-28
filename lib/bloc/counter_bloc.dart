import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>((event, emit) {
      emit(state + 1);
    });
    on<CounterDecrementPressed>((event, emit) {
      emit(state - 1);
    });
  }

  @override
  void onEvent(CounterEvent event) {
    print('onEvent $event');
    super.onEvent(event);
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print('onTransition $transition');
    super.onTransition(transition);
  }
}
