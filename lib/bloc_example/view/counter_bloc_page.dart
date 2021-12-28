import 'package:counter_bloc_concepts/bloc_example/bloc/counter_bloc.dart';
import 'package:counter_bloc_concepts/bloc_example/view/counter_bloc_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterBlocView(
        title: 'Bloc',
      ),
    );
  }
}
