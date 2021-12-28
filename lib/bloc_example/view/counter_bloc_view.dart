import 'package:counter_bloc_concepts/bloc_example/bloc/counter_bloc.dart';
import 'package:counter_bloc_concepts/shared/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocView extends StatelessWidget {
  final String title;

  const CounterBlocView({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Menu(
        context: context,
      ),
      body: Center(
        child: BlocConsumer<CounterBloc, int>(
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
            return Text(state.toString());
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
                context.read<CounterBloc>().add(CounterDecrementPressed());
              },
              key: const ValueKey('remove_button'),
              icon: const Icon(Icons.remove),
              label: const Text('1'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.read<CounterBloc>().add(CounterIncrementPressed());
              },
              key: const ValueKey('add_button'),
              icon: const Icon(Icons.add),
              label: const Text('1'),
            )
          ],
        ),
      ),
    );
  }
}
