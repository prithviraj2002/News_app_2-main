import 'package:flutter/material.dart';
import 'package:news_app_2/models/health_news.dart';
import 'package:provider/provider.dart';

import '../widgets/news_tile.dart';

class BioNews extends StatefulWidget {
  const BioNews({Key? key}) : super(key: key);

  @override
  State<BioNews> createState() => _BioNews();
}

class _BioNews extends State<BioNews> {

  var isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<HealthNews>(context, listen: false)
        .getNews('health')
        .then((_) => {isLoading = false});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<HealthNews>(context).filteredArticles;
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