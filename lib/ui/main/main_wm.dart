import 'package:flutter/material.dart';

import '../../network/chucknorris_client.dart';
import 'component/categories_wm.dart';
class MainWidgetModel extends ChangeNotifier {
  final ChuckNorrisClient _chuckNorrisClient;
  final CategoriesWidgetModel _categories;

  MainWidgetModel(this._chuckNorrisClient, this._categories) {
    updateJoke();
  }

  String _joke = "";

  String get joke => _joke;

  void updateJoke() {
    var selectedCategories = _categories.getSelectedCategories();

    _chuckNorrisClient
        .getRandomJoke(selectedCategories)
        .then((joke) => _joke = joke)
        .then((_) => notifyListeners());
  }
}
