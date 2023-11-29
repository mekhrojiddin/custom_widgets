import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/status.dart';

part 'news_state.dart';
// part 'news_event.dart';

class NewsBloc extends Cubit<NewsState> {
  NewsBloc()
      : super(const NewsState(
          status: LoadingStatus.pure,
          news: [],
        ));

  Future<void> getNews({
    required Function() onSuccess,
    required Function(String errorMessage) onFailure,
  }) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final dio = Dio();
      final response = await dio.get(
          "https://newsapi.org/v2/everything?q=keyword&apiKey=38ea3b90702044ee88f5b6e5396cf1a5");
      final news = NewModel.fromJson(response.data);
      emit(state.copyWith(status: LoadingStatus.loadedWithSuccess));
    } catch (e) {
      emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
    }
  }
}
