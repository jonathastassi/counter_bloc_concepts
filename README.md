# counter_bloc_concepts

Criei esse projeto para colocar em prática o conhecimento sobre a utilização do Bloc.

## Materiais de estudo

Se você não conhece o bloc, recomendo estudar a documentação e assistir o vídeo abaixo, irá ajudar bem.

[Documentação do Flutter_bloc](https://bloclibrary.dev/#/gettingstarted)

[Vídeo sobre Bloc](https://www.youtube.com/watch?v=THCkkQ-V1-8&t=3226s)

## Widgets utilizados

- <strong>BlocProvider</strong> - Esse widget é responsável por prover o cubit/bloc na árvore de widgets. Com isso, consigo recuperar o bloc em qualquer widget filho.
  [Aqui](https://github.com/jonathastassi/counter_bloc_concepts/blob/main/lib/bloc_example/view/counter_bloc_page.dart#L13) tem um exemplo de uso.

  Para recuperar o cubit/bloc em algum dos widgets filhos, basta fazer assim: `context.read<CounterBloc>().add(CounterDecrementPressed());`

  [Exemplo do context.read<CounterBloc>()](https://github.com/jonathastassi/counter_bloc_concepts/blob/main/lib/bloc_example/view/counter_bloc_view.dart#L47)

  [Documentação](https://bloclibrary.dev/#/flutterbloccoreconcepts?id=blocprovider)

- <strong>BlocConsumer</strong> - Esse widget é responsável por atualizar os dados do filho dele, de acordo com o estado armazenado pelo cubit/bloc. Conforme o estado é atualizado, o widget filho do BlocConsumer, será atualizado em tempo real.
  O BlocListener funciona como se fosse a junção do BlocListener+BlocBuilder, onde é possível ter um callback de listener, pra executar algo de acordo com condições e também é possível ter um callback builder, que será responsável por renderizar as atualizações de estado.
  [Aqui](https://github.com/jonathastassi/counter_bloc_concepts/blob/main/lib/bloc_example/view/counter_bloc_view.dart#L25) tem um exemplo de uso.

  [Documentação](https://bloclibrary.dev/#/flutterbloccoreconcepts?id=bloclistener)

## Organização e estrutura

Acabei optando por criar 2 exemplos, um usando cubit e outro usando bloc.
Em resumo, a grande diferença dos 2, é que o cubit é orientado por funções e o bloc é orientado por eventos.

- [Bloc](https://github.com/jonathastassi/counter_bloc_concepts/blob/main/lib/bloc_example/bloc/counter_bloc.dart) - São criados eventos, onde é possível definir comportamentos de acordo com cada evento, e esses eventos podem manipular o estado
- [Cubit](https://github.com/jonathastassi/counter_bloc_concepts/blob/main/lib/cubit_example/cubit/counter_cubit.dart) - São criados métodos, que tem objetivo de manipular o estado
  
## Testes unitários e de widgets
  - [Documentação](https://bloclibrary.dev/#/testing?id=testing)
  - [Teste do bloc](https://github.com/jonathastassi/counter_bloc_concepts/blob/main/test/bloc_example/bloc/counter_bloc_test.dart)
  - [Teste de view/page](https://github.com/jonathastassi/counter_bloc_concepts/blob/main/test/bloc_example/view/counter_bloc_view_test.dart)
  
## Resumo para usar bloc/cubit no projeto
  - Instalar pacote [flutter_bloc](https://pub.dev/packages/flutter_bloc)
  - Criar um BlocProvider
  - Usar BlocConsumer, BlocBuilder ou BlocListener para consumir o cubit/bloc declarado no BlocProvider
  - Para testes, instalar [bloc_test](https://pub.dev/packages/bloc_test) e [test](https://pub.dev/packages/test)
  
## Demonstração

<div style="width: 100%; text-align: center;">
<img src="https://github.com/jonathastassi/counter_bloc_concepts/blob/main/demonstration/counter.gif" alt="Demonstração">
</div>
