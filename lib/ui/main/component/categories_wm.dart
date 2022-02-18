import 'package:flutter/material.dart';

import '../../../network/chucknorris_client.dart';

class CategoriesWidgetModel extends ChangeNotifier {
  final ChuckNorrisClient _chuckNorrisClient;

  CategoriesWidgetModel(this._chuckNorrisClient) {
    _initCategories();
  }

  final Map<String, bool> _categories = {};

  Map<String, bool> get categories => Map.from(_categories);

  int get selectedCategoriesCount => getSelectedCategories().length;

  void _initCategories() {
    _chuckNorrisClient.getCategories().then((categories) {
      for (var category in categories) {
        _categories[category] = false;
      }
      notifyListeners();
    });
  }

  void toggleCategory(String category) {
    _categories[category] = !(_categories[category] ?? true);
    notifyListeners();
  }

  List<String> getSelectedCategories() {
    return _categories.entries
        .where((entry) => entry.value)
        .map((e) => e.key)
        .toList();
  }
}
