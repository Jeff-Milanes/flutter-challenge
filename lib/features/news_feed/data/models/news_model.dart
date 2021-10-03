import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  const NewsModel({this.title, this.description, this.url, this.urlToImage});

  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
