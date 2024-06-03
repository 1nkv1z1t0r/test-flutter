import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_era_developers/repositories/news/repository.dart';

part 'news_page_event.dart';

part 'news_page_state.dart';

class NewsPageBloc extends Bloc<NewsPageEvent, NewsPageState> {
  NewsPageBloc({
    required MockNewsRepository dataRepository,
  })  : _dataRepository = dataRepository,
        super(const NewsPageState(
          latestArticles: null,
          featuredArticles: null,
        )) {
    on<LatestArticlesLoadingStarted>(_onLatestArticlesLoadingStarted);
    on<FeaturedArticlesLoadingStarted>(_onFeaturedArticlesLoadingStarted);
    on<MarkAllRead>(_onMarkAllRead);
  }

  final MockNewsRepository _dataRepository;

  FutureOr<void> _onLatestArticlesLoadingStarted(
    LatestArticlesLoadingStarted event,
    Emitter<NewsPageState> emit,
  ) async {
    final articles = await _dataRepository.getLatestArticles();
    emit(NewsPageState(
        latestArticles: articles, featuredArticles: state.featuredArticles));
  }

  FutureOr<void> _onMarkAllRead(
    MarkAllRead event,
    Emitter<NewsPageState> emit,
  ) async {
    List<Article> newArticles = List.empty(growable: true);
    for (var articles in state.latestArticles!) {
      newArticles.add(articles.copyWith(readed: true));
    }
    emit(NewsPageState(
        latestArticles: newArticles, featuredArticles: state.featuredArticles));
  }

  FutureOr<void> _onFeaturedArticlesLoadingStarted(
    FeaturedArticlesLoadingStarted event,
    Emitter<NewsPageState> emit,
  ) async {
    final articles = await _dataRepository.getFeaturedArticles();
    emit(NewsPageState(
        latestArticles: state.latestArticles, featuredArticles: articles));
  }
}
