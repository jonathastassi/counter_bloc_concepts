import 'package:bloc_test/bloc_test.dart';
import 'package:counter_bloc_concepts/bloc_example/bloc/counter_bloc.dart';
import 'package:counter_bloc_concepts/bloc_example/view/counter_bloc_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterBloc extends MockBloc<CounterEvent, int>
    implements CounterBloc {}

void main() {
  group('CounterBlocView', () {
    late CounterBloc mockCounterBloc;

    setUp(() {
      mockCounterBloc = MockCounterBloc();
    });

    setUpAll(() {
      registerFallbackValue(CounterDecrementPressed());
      registerFallbackValue(CounterIncrementPressed());
    });

    testWidgets('Should be created', (WidgetTester tester) async {
      when(() => mockCounterBloc.state).thenReturn(0);

      await tester.pumpWidget(
        BlocProvider.value(
          value: mockCounterBloc,
          child: const MaterialApp(
            home: CounterBlocView(
              title: 'Bloc Tests',
            ),
          ),
        ),
      );

      expect(find.text('Bloc Tests'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('When click +1 should pass CounterIncrementPressed event',
        (WidgetTester tester) async {
      when(() => mockCounterBloc.state).thenReturn(0);

      await tester.pumpWidget(
        BlocProvider.value(
          value: mockCounterBloc,
          child: const MaterialApp(
            home: CounterBlocView(
              title: 'Bloc Tests',
            ),
          ),
        ),
      );

      await tester.tap(find.byKey(const ValueKey('add_button')));

      await tester.pumpAndSettle();

      verify(() => mockCounterBloc.add(any<CounterIncrementPressed>()))
          .called(1);
    });

    testWidgets('When click -1 should pass CounterDecrementPressed event',
        (WidgetTester tester) async {
      when(() => mockCounterBloc.state).thenReturn(0);

      await tester.pumpWidget(
        BlocProvider.value(
          value: mockCounterBloc,
          child: const MaterialApp(
            home: CounterBlocView(
              title: 'Bloc Tests',
            ),
          ),
        ),
      );

      await tester.tap(find.byKey(const ValueKey('remove_button')));

      await tester.pumpAndSettle();

      verify(() => mockCounterBloc.add(any<CounterDecrementPressed>()))
          .called(1);
    });

    test('Validate key', () {
      final key = GlobalKey();
      final view = CounterBlocView(
        key: key,
        title: 'someTitle',
      );

      expect(key, view.key);
    });

    testWidgets(
        'When state is number "par", should show a snackbar with "Número par"',
        (WidgetTester tester) async {
      whenListen(
        mockCounterBloc,
        Stream.fromIterable([
          1,
          2,
        ]),
      );

      when(() => mockCounterBloc.state).thenReturn(0);

      await tester.pumpWidget(
        BlocProvider.value(
          value: mockCounterBloc,
          child: const MaterialApp(
            home: CounterBlocView(
              title: 'Bloc Tests',
            ),
          ),
        ),
      );

      await tester.tap(find.byKey(const ValueKey('add_button')));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
