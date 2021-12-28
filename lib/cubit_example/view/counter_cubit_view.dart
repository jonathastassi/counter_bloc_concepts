import 'package:counter_bloc_concepts/cubit_example/cubit/counter_cubit.dart';
import 'package:counter_bloc_concepts/shared/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitView extends StatelessWidget {
  final String title;

  const CounterCubitView({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Menu(
        context: context,
      ),
      body: Center(
        child: BlocConsumer<CounterCubit, int>(
          listener: (_, state) {
            if (state % 2 == 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Número par'),
                ),
              );
            }
          },
          builder: (context, state) {
            return Text(
              state.toString(),
              style: const TextStyle(
                fontSize: 32,
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                context.read<CounterCubit>().decrement();
              },
              icon: const Icon(Icons.remove),
              label: const Text('1'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.read<CounterCubit>().error();
              },
              icon: const Icon(Icons.error),
              label: const Text('Error'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              icon: const Icon(Icons.add),
              label: const Text('1'),
            )
          ],
        ),
      ),
    );
  }
}
