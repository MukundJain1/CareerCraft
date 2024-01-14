


import '../model/CategoriesNews.dart';
import '../model/NewsChannelHeadlines.dart';
import '../model/NewsRepository/newsRepo.dart';

class NewsViewRepo{
  final _rep = NewsRepo();
  Future<NewsChannelHeadlines> fetchNewsChannelHeadlines(String channelName) async{
    final response =await _rep.fetchNewsChannelHeadlines(channelName);
    return response;
  }

  final _cat = NewsRepo();

  Future<CategoriesNews> fetchCategoriesNews(String categories) async{
    final response1 = await _cat.fetchCategoriesNews(categories);
    return response1;
  }
}