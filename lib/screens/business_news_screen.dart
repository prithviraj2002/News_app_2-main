import 'package:flutter/material.dart';
import 'package:news_app_2/models/business_news.dart';
import 'package:provider/provider.dart';

import '../widgets/news_tile.dart';

class BusinessNewScreen extends StatefulWidget {
  const BusinessNewScreen({Key? key}) : super(key: key);

  @override
  State<BusinessNewScreen> createState() => _BusinessNewScreenState();
}

class _BusinessNewScreenState extends State<BusinessNewScreen> {
  var isLoading = false;

  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    Provider.of<BusinessNews>(context, listen: false)
        .getNews('business')
        .then((_) => {isLoading = false});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsData = Provider.of<BusinessNews>(context).filteredArticles;
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