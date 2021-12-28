import 'package:counter_bloc_concepts/cubit/counter_cubit.dart';
import 'package:counter_bloc_concepts/view/cubit/counter_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterCubitView(
        title: 'Cubit',
      ),
    );
  }
}
