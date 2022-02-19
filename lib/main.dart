import 'package:chucknorris/ui/main/state/joke_state.dart';
import 'package:chucknorris/network/chucknorris_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/main/state/categories_state.dart';
import 'ui/main/main_page.dart';

void main() {
  runApp(
    MultiProvider(
      child: const App(),
      providers: [
        Provider<Dio>(create: (_) => Dio()),
        Provider<ChuckNorrisClient>(
          create: (context) => ChuckNorrisClient(context.read<Dio>()),
        ),
        ChangeNotifierProvider<CategoriesState>(
          create: (context) =>
              CategoriesState(context.read<ChuckNorrisClient>()),
        ),
        ChangeNotifierProvider<JokeState>(
          create: (context) => JokeState(
            context.read<ChuckNorrisClient>(),
            context.read<CategoriesState>(),
          ),
        )
      ],
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chuck Norris Jokes',
      theme: ThemeData(
        chipTheme: ChipThemeData.fromDefaults(
          primaryColor: Colors.blue,
          secondaryColor: Colors.blue,
          labelStyle: const TextStyle(),
        ),
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
