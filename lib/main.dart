import 'package:chucknorris/main_widget_model.dart';
import 'package:chucknorris/network/chucknorris_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      child: const MyApp(),
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris Jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chuck Norris Jokes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              context.watch<MainWidgetModel>().joke,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<MainWidgetModel>().updateJoke(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
