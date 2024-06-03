part of 'news_page_bloc.dart';

abstract class NewsPageEvent {}

class LatestArticlesLoadingStarted extends NewsPageEvent {}

class FeaturedArticlesLoadingStarted extends NewsPageEvent {}

class MarkAllRead extends NewsPageEvent {}
