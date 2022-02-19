import 'package:flutter/material.dart';

import '../../../network/chucknorris_client.dart';
import '../../../network/model/joke.dart';
import 'categories_state.dart';

class JokeState extends ChangeNotifier {
  final ChuckNorrisClient _chuckNorrisClient;
  final CategoriesState _categories;

  JokeState(this._chuckNorrisClient, this._categories) {
    updateJoke();
  }

  Joke? _joke;

  Joke? get joke => _joke;

  Future<void> updateJoke() async {
    var selectedCategories = _categories.getSelectedCategories();

    _joke = await _chuckNorrisClient.getRandomJoke(selectedCategories);
    notifyListeners();
  }
}
