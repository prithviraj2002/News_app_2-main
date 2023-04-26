import 'package:flutter/material.dart';
import 'package:news_app_2/models/entertainment_news.dart';
import 'package:provider/provider.dart';

import '../widgets/news_tile.dart';

class EntertainmentNewScreen extends StatefulWidget {
  const EntertainmentNewScreen({Key? key}) : super(key: key);

  @override
  State<EntertainmentNewScreen> createState() => _EntertainmentNewScreenState();
}

class _EntertainmentNewScreenState extends State<EntertainmentNewScreen> {
  var isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<EntertainmentNews>(context, listen: false)
        .getNews('entertainment')
        .then((_) => {isLoading = false});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<EntertainmentNews>(context).filteredArticles;
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