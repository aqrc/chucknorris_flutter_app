import 'package:dio/dio.dart';

import 'model/joke.dart';

class ChuckNorrisClient {
  final Dio _dio;

  static const commonPath = "https://api.chucknorris.io/jokes";

  ChuckNorrisClient(this._dio);

  Future<Joke> getRandomJoke(List<String> categories) async {
    var result = await _dio.get<Map<String, dynamic>>(
      "$commonPath/random",
      queryParameters: {"category": categories},
    );
    return Joke.fromJson(result.data!); // TODO handle properly
  }

  Future<List<String>> getCategories() async {
    var result = await _dio.get<List<dynamic>>("$commonPath/categories");
    return result.data!
        .map((e) => e as String)
        .toList(); // TODO handle properly
  }
}
