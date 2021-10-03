import 'package:coding_challenge/features/news_feed/data/models/news_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

abstract class NewsFeedDataSource {
  Future<List<NewsModel>> getNews();
}

@LazySingleton(as: NewsFeedDataSource)
class ImpNewsFeedDataSource implements NewsFeedDataSource {
  ImpNewsFeedDataSource(this._dio);

  final Dio _dio;

  @override
  Future<List<NewsModel>> getNews() async {
    final _baseUrl = dotenv.env['NEWS_URL'];
    final response = await _dio.get(_baseUrl!, queryParameters: {
      'apiKey': dotenv.env['NEWS_FEED_API'],
      'country': 'ph',
    });

    return (response.data['articles'] as List)
        .map((e) => NewsModel.fromJson(e))
        .toList();
  }
}
