import 'package:dio/dio.dart';

class ChuckNorrisClient {
  final Dio _dio;

  static const commonPath = "https://api.chucknorris.io/jokes";

  ChuckNorrisClient(this._dio);

  Future<String> getRandomJoke() async {
    var result = await _dio.get<Map<String, dynamic>>("$commonPath/random");
    return result.data?["value"]; // FIXME handle properly
  }
}