import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(children: [
          ListTile(
            title: const Text('Gender'),
            leading: const Icon(Icons.supervised_user_circle),
            onTap: () {
              GoRouter.of(context).go('/');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Age'),
            leading: const Icon(Icons.supervised_user_circle_outlined),
            onTap: () {
              GoRouter.of(context).go('/age');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Universities'),
            leading: const Icon(Icons.school),
            onTap: () {
              GoRouter.of(context).go('/universities');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(Icons.info),
            onTap: () {
              GoRouter.of(context).go('/about');
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Weather'),
            leading: const Icon(Icons.cloud),
            onTap: () {
              GoRouter.of(context).go('/weather');
              Navigator.pop(context);
            },
          )
        ]),
      );
}
