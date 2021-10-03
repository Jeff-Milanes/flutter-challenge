part of 'news_cubit.dart';

class NewsState {
  const NewsState({
    this.news,
    this.status = NewsStatus.initial,
  });

  final List<NewsModel>? news;
  final NewsStatus status;

  NewsState copyWith({
    NewsStatus? status,
    List<NewsModel>? news,
  }) {
    return NewsState(status: status ?? this.status, news: news ?? this.news);
  }
}

enum NewsStatus { initial, loading, success, failed }
