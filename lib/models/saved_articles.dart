import 'package:flutter/material.dart';
import 'package:news_app_2/models/news.dart';

class savedArticles with ChangeNotifier {
  List<News> _savedItems = [];

  List<News> get savedItems {
    return [..._savedItems];
  }

  void saveArticle(News n) {
    _savedItems.add(n);
    notifyListeners();
  }

  void unsaveArticle(News n) {
    _savedItems.removeWhere((news) => news == n);
    notifyListeners();
  }
}
