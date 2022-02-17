import 'package:chucknorris/network/chucknorris_client.dart';
import 'package:flutter/material.dart';

class MainWidgetModel extends ChangeNotifier {
  final ChuckNorrisClient _chuckNorrisClient;

  MainWidgetModel(this._chuckNorrisClient);

  String _joke = "Press + to get a joke";
  String get joke => _joke;

  void updateJoke() {
    _chuckNorrisClient
        .getRandomJoke()
        .then((joke) => _joke = joke)
        .then((_) => notifyListeners());
  }
}
