import 'dart:convert';
import 'package:http/http.dart' as http;

import '../CategoriesNews.dart';
import '../NewsChannelHeadlines.dart';


const _api = 'cbd21efaffc74890b835f7cf32fa84f7'; // API key
class NewsRepo{

  Future<NewsChannelHeadlines> fetchNewsChannelHeadlines(String channelName) async{

    final url = 'https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=$_api'; // url

    final response =await http.get(Uri.parse(url)); // hit the url to get the news

    if(response.statusCode == 200){ // check the status of server
      final body = jsonDecode(response.body); // decode the json file
      return NewsChannelHeadlines.fromJson(body); // return the results that is decoded from json file
    }
    throw Exception('error');
  }

  Future<CategoriesNews> fetchCategoriesNews(String category) async{

    final url = 'https://newsapi.org/v2/everything?q=$category&apiKey=$_api'; // url

    final response1 =await http.get(Uri.parse(url)); // hit the url to get the news

    if(response1.statusCode == 200){ // check the status of server
      final body = jsonDecode(response1.body); // decode the json file
      return CategoriesNews.fromJson(body); // return the results that is decoded from json file
    }
    throw Exception('error');
  }
}