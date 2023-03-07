import 'package:couteau/views/about.dart';
import 'package:couteau/views/age.dart';
import 'package:couteau/views/gender.dart';
import 'package:couteau/views/universities.dart';
import 'package:couteau/views/weather.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(routes: [
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const Gender()),
      GoRoute(
          path: '/age',
          builder: (BuildContext context, GoRouterState state) => const Age()),
      GoRoute(
          path: '/universities',
          builder: (BuildContext context, GoRouterState state) =>
              const Universities()),
      GoRoute(
          path: '/about',
          builder: (BuildContext context, GoRouterState state) =>
              const About()),
      GoRoute(
        path: '/weather',
        builder: (BuildContext context, GoRouterState state) => 
        const Weather())
    ]);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
