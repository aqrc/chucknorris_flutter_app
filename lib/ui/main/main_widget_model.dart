import 'package:chucknorris/network/chucknorris_client.dart';
import 'package:flutter/material.dart';

class MainWidgetModel extends ChangeNotifier {
  final ChuckNorrisClient _chuckNorrisClient;

  MainWidgetModel(this._chuckNorrisClient) {
    _initCategories();
    updateJoke();
  }

  String _joke = "";

  String get joke => _joke;

  final Map<String, bool> _categories = {};

  Map<String, bool> get categories => Map.from(_categories);

  int get selectedCategoriesCount =>
      _categories.entries.where((entry) => entry.value).length;

  void updateJoke() {
    var selectedCategories = _categories.entries
        .where((entry) => entry.value)
        .map((e) => e.key)
        .toList();

    _chuckNorrisClient
        .getRandomJoke(selectedCategories)
        .then((joke) => _joke = joke)
        .then((_) => notifyListeners());
  }

  void _initCategories() {
    _chuckNorrisClient.getCategories().then((categories) {
      for (var category in categories) {
        print(category);
        _categories[category] = false;
      }
      notifyListeners();
    });
  }

  void toggleCategory(String category) {
    _categories[category] = !(_categories[category] ?? true);
    notifyListeners();
  }
}
