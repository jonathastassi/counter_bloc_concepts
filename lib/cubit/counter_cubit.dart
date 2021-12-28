import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void error() => addError(Exception('Erro no cubit'));

  @override
  void onChange(Change<int> change) {
    print('CounterCubit $change');
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('CounterCubit - error - $error');
    print('CounterCubit - stackTrace - $stackTrace');
    emit(0);
    super.onError(error, stackTrace);
  }
}
