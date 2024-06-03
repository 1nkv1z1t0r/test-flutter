class Article {
  const Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    this.readed = false,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  final bool readed;
  final String? description;

  Article copyWith({
    bool? readed,
  }) {
    return Article(
        title: title,
        id: id,
        imageUrl: imageUrl,
        publicationDate: publicationDate,
        description: description,
        readed: readed ?? this.readed);
  }
}
