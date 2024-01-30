import 'package:bloc/bloc.dart';
import 'package:newsapp/repository/news_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'managenews_event.dart';
part 'managenews_state.dart';

class ManagenewsBloc extends Bloc<ManagenewsEvent, ManagenewsState> {
  NewsRepository newsRepository;

  ManagenewsBloc({required this.newsRepository}) : super(LoadingListnews()) {
    on<LoadListNewsEvent>(_listnews);
  }

  _listnews(LoadListNewsEvent event, Emitter emit) async {
    String key = event.keyword;

    emit(LoadingListnews());
    List res = await newsRepository.getNewsList(key);
    // log(res.toString());
    emit(ManagenewsInitial(news: res, searchText: key));
  }
}
