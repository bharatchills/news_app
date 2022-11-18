import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';

import '../constants/strings.dart';

// ignore: camel_case_types
class API_Manager {
  Future<News> getNews() async {
    var client = http.Client();
    dynamic newsModel;

    try {
      // newsUrl ='http://newsapi.org/v2/everything?domains=wsj.com&apiKey={YOUR_API_KEY}';

      var response = await client.get(Uri.parse(Strings.newsUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = News.fromJson(jsonMap);
      }
    } on Exception {
      return newsModel;
    }

    return newsModel;
  }
}
