part of 'news_bloc.dart';

class NewsState {
  final LoadingStatus status;
  final List<NewModel> news;

  const NewsState({
    required this.status,
    required this.news,
  });

  NewsState copyWith({
    LoadingStatus? status,
    List<NewModel>? news,
  }) {
    return NewsState(
      status: status ?? this.status,
      news: news ?? this.news,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsState &&
        other.status == status &&
        listEquals(other.news, news);
  }

  @override
  int get hashCode => status.hashCode ^ news.hashCode;
}