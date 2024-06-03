part of 'detailed_news_page_bloc.dart';

class DetailedNewsPageState extends Equatable {
  final Article? articles;

  const DetailedNewsPageState({required this.articles});

  @override
  List<Object?> get props => [articles];
}