part of 'news_page_bloc.dart';

class NewsPageState extends Equatable {
  final List<Article>? latestArticles;
  final List<Article>? featuredArticles;

  const NewsPageState({required this.latestArticles, required this.featuredArticles});

  @override
  List<Object?> get props => [latestArticles, featuredArticles];
}