import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'news.dart';

class SportsNews with ChangeNotifier {
  List<News> _articles = [];

  List<News> get articles {
    return [..._articles];
  }

  Future<void> getNews(String category) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=8624a6fc3d0f435499088d9f2103f33d');

    try {
      final response = await http.get(url);
      final newsData = jsonDecode(response.body);
      final extractedArticles = newsData['articles'];
      for (Map<String, dynamic> a in extractedArticles) {
        _articles.add(News(
            title: a['title']?? 'Latest News!',
            description: a['description']?? 'This is the default description',
            content: a['content']?? 'This is the default content',
            imageUrl: a['urlToImage']?? 'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80',
            link: a['url']));
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  News findByTitle(String title) {
    return _articles.firstWhere((news) => news.title == title);
  }

  List<News> get filteredArticles{
    return articles
        .where((newsItem) =>
            newsItem.link.isNotEmpty && newsItem.content.isNotEmpty && newsItem.imageUrl.isNotEmpty && newsItem
            .title.isNotEmpty && newsItem.description.isNotEmpty)
        .toList();
  }
}
