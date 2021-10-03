import 'package:bloc/bloc.dart';
import 'package:coding_challenge/features/news_feed/data/models/news_model.dart';
import 'package:coding_challenge/features/news_feed/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

part 'news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._newsRepository) : super(const NewsState());

  final NewsRepository _newsRepository;

  Future<void> getNews() async {
    emit(state.copyWith(status: NewsStatus.loading));
    try {
      final news = await _newsRepository.getNews();
      emit(state.copyWith(news: news, status: NewsStatus.success));
    } catch (_) {
      emit(state.copyWith(status: NewsStatus.failed));
    }
  }
}
