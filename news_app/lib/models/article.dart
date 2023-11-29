class ArticleModel {
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticleModel({
    required this.description,
    required this.author,
    required this.content,
    required this.publishedAt,
    required this.title,
    required this.urlToImage,
  });
}
