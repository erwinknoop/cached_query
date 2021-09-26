import 'package:examples/screens/home.screen.dart';
import 'package:examples/screens/joke.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/joke/joke_bloc.dart';
import 'blocs/post/post_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (_) => BlocProvider(
              create: (_) => PostBloc(),
              child: const HomeScreen(),
            ),
        JokeScreen.routeName: (_) => BlocProvider(
              create: (_) => JokeBloc(),
              child: const JokeScreen(),
            ),
      },
      title: 'Flutter Demo',
    );
  }
}
