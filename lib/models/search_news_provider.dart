import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'news.dart';

class searchedNews with ChangeNotifier {
  List<News> _items = [];
  var totalArticles = 0;

  List<News> get items {
    return [..._items];
  }

  int get totalResults {
    return totalArticles;
  }

  Future<void> fetchArticles(String searchText) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$searchText&from=2022-05-25&sortBy=publishedAt&apiKey=8624a6fc3d0f435499088d9f2103f33d');

    try {
      final response = await http.get(url);
      final newsData = jsonDecode(response.body);
      // totalArticles = newsData['totalResults'];
      final extractedArticles = newsData['articles'];
      if(extractedArticles == null){
        return;
      }
      for (Map<String, dynamic> a in extractedArticles) {
        _items.add(News(
            title: a['title'] ?? 'Latest News!',
            description: a['description'] ?? 'This is the default description',
            content: a['content'] ?? 'This is the default content',
            imageUrl: a['urlToImage'] ??
                'https://i.picsum.photos/id/1073/5472/3648.jpg?hmac=xCDetU9pLnLGZopbvHOQOkQRhTiYwyrzWc0YyHPzp5Y',
            link: a['url']));
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
