import 'package:chucknorris/ui/main/main_widget_model.dart';
import 'package:chucknorris/network/chucknorris_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider<MainWidgetModel>(
          create: (context) =>
              MainWidgetModel(context.read<ChuckNorrisClient>()),
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
      title: 'Chuck Norris Jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
