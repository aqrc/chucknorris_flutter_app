import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_widget_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Chuck Norris Jokes'),
      // ),
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