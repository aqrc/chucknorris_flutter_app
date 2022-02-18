import 'package:json_annotation/json_annotation.dart';

part 'joke.g.dart';

@JsonSerializable()
class Joke {
  final List<String> categories;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "icon_url")
  final String iconUrl;
  final String id;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  final String url;
  final String value;

  Joke(this.categories, this.createdAt, this.iconUrl, this.id, this.updatedAt, this.url, this.value);

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);
}