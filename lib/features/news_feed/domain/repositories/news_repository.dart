import 'package:coding_challenge/features/news_feed/data/datasources/news_feed_datasource.dart';
import 'package:coding_challenge/features/news_feed/data/models/news_model.dart';
import 'package:injectable/injectable.dart';

abstract class NewsRepository {
  Future<List<NewsModel>> getNews();
}

@LazySingleton(as: NewsRepository)
class ImpNewsRepository implements NewsRepository {
  ImpNewsRepository(this._newsFeedDataSource);

  final NewsFeedDataSource _newsFeedDataSource;

  @override
  Future<List<NewsModel>> getNews() async {
    return _newsFeedDataSource.getNews();
  }
}
