import 'package:flutter/material.dart';
import 'package:news_app_2/models/tech_news.dart';
import 'package:provider/provider.dart';

import '../widgets/news_tile.dart';

class TechNewScreen extends StatefulWidget {
  const TechNewScreen({Key? key}) : super(key: key);

  @override
  State<TechNewScreen> createState() => _TechNewScreenState();
}

class _TechNewScreenState extends State<TechNewScreen> {
  var isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<TechNews>(context, listen: false)
        .getNews('technology')
        .then((_) => {isLoading = false});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<TechNews>(context).filteredArticles;
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