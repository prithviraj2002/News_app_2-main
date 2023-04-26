import 'package:flutter/material.dart';
import 'package:news_app_2/models/sports_news.dart';
import 'package:provider/provider.dart';

import '../models/news_api.dart';
import '../widgets/news_tile.dart';

class SportScreen extends StatefulWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  State<SportScreen> createState() => _SportScreenState();
}

class _SportScreenState extends State<SportScreen> {

  var isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<SportsNews>(context, listen: false)
        .getNews('sports')
        .then((_) => {isLoading = false});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<SportsNews>(context).filteredArticles;
    return Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                height: double.infinity,
                width: double.infinity,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: newsData.length,
                    itemBuilder: (context, i) {
                      return NewsTile(newsData[i]);
                    },
                  ),
                ),
              ));
  }
}