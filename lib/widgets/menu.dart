import 'package:flutter/material.dart';

class Menu extends Drawer {
  final BuildContext context;

  Menu({Key? key, 
    required this.context
  }) : super(key: key, 
    child: ListView(
      children: [
        ListTile(
          title: const Text('Counter with Bloc'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/bloc');
          },
        ),
        ListTile(
          title: const Text('Counter with Cubit'),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/cubit');
          },
        )
      ],
    )
  );
}