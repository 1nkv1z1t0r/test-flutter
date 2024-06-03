import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_era_developers/repositories/news/repository.dart';

part 'detailed_news_page_event.dart';

part 'detailed_news_page_state.dart';

class DetailedNewsPageBloc
    extends Bloc<DetailedNewsPageEvent, DetailedNewsPageState> {
  DetailedNewsPageBloc(
      {required MockNewsRepository dataRepository, required String id})
      : _dataRepository = dataRepository,
        _id = id,
        super(const DetailedNewsPageState(articles: null)) {
    on<ArticlesLoadingStarted>(_ontArticlesLoadingStarted);
  }

  final MockNewsRepository _dataRepository;
  final String _id;

  FutureOr<void> _ontArticlesLoadingStarted(
    ArticlesLoadingStarted event,
    Emitter<DetailedNewsPageState> emit,
  ) async {
    final articles = await _dataRepository.getArticle(_id);
    emit(DetailedNewsPageState(articles: articles));
  }
}
