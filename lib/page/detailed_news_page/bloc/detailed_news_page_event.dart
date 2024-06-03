part of 'detailed_news_page_bloc.dart';

abstract class DetailedNewsPageEvent {}

class ArticlesLoadingStarted extends DetailedNewsPageEvent {
  final String id;

  ArticlesLoadingStarted({required this.id});
}
