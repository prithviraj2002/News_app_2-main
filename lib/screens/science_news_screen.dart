import 'package:flutter/material.dart';
import 'package:news_app_2/models/science_news.dart';
import 'package:provider/provider.dart';

import '../widgets/news_tile.dart';

class ScienceNewScreen extends StatefulWidget {
  const ScienceNewScreen({Key? key}) : super(key: key);

  @override
  State<ScienceNewScreen> createState() => _ScienceNewScreenState();
}

class _ScienceNewScreenState extends State<ScienceNewScreen> {
  var isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<ScienceNews>(context, listen: false)
        .getNews('science')
        .then((_) => {isLoading = false});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<ScienceNews>(context).filteredArticles;
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