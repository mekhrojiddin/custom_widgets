import 'article.dart';

class NewModel {
  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  NewModel({
    required this.status,
    required this.articles,
    required this.totalResults,
  });
  factory NewModel.fromJson(Map<String, dynamic> json) {
    return NewModel(
      status: json["status"]?? " ",
      articles: (json["articles"] as List)
          .map(
              (data) =>
              ArticleModel(
                author: data["auther"] ??' ',
                content: data["content"]??' ',
                description: data["description"]??' ',
                publishedAt: data["publishedAt"]??' ',
                title: data["title"]??' ',
                urlToImage: data["urlToImage"]??' ',
              )
      ).toList(),
      totalResults: json["totalResults"]?? 0,
    );
  }
}
