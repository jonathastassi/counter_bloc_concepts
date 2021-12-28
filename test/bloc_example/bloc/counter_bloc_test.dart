import 'package:bloc_test/bloc_test.dart';
import 'package:counter_bloc_concepts/bloc_example/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    tearDown(() {
      counterBloc.close();
    });

    test('Should be created and initial value is 0', () {
      expect(counterBloc.state, 0);
    });

    blocTest(
      'emit +1 when CounterIncrementPressed is added',
      build: () => counterBloc,
      act: (CounterBloc bloc) => bloc.add(CounterIncrementPressed()),
      expect: () => [1],
    );

    blocTest(
      'emit +1 when CounterIncrementPressed is added two times',
      build: () => counterBloc,
      act: (CounterBloc bloc) {
        bloc.add(CounterIncrementPressed());
        bloc.add(CounterIncrementPressed());
      },
      expect: () => [1, 2],
    );

    blocTest(
      'emit -1 when CounterDecrementPressed is added',
      build: () => counterBloc,
      act: (CounterBloc bloc) => bloc.add(CounterDecrementPressed()),
      expect: () => [-1],
    );
  });
}
