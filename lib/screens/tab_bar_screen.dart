import 'package:flutter/material.dart';
import 'package:news_app_2/screens/business_news_screen.dart';
import 'package:news_app_2/screens/entertainment_news_screen.dart';
import 'package:news_app_2/screens/health_news.dart';
import 'package:news_app_2/screens/home_screen.dart';
import 'package:news_app_2/screens/saved_articles_screen.dart';
import 'package:news_app_2/screens/science_news_screen.dart';
import 'package:news_app_2/screens/search_screen.dart';
import 'package:news_app_2/screens/sports_screen.dart';
import 'package:news_app_2/screens/tech_news_screen.dart';
import 'package:news_app_2/widgets/advanced_drawer.dart';

class TabBarScreen extends StatefulWidget {
  static const routeName = '/tab-bar-screen';
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          actions: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.of(context).pushNamed(SearchScreen.routeName);
                    },
                  ),
                )
              ],
            )
          ],
          title: const Text('True Ink',
                      style: TextStyle(fontWeight: FontWeight.bold)),
          bottom: const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.red,
              isScrollable: true,
              tabs: <Widget>[
                Tab(text: 'General'),
                Tab(text: 'Sports'),
                Tab(text: 'Business'),
                Tab(text: 'Science'),
                Tab(text: 'Technology'),
                Tab(text: 'Health'),
                Tab(text: 'Entertainment')
              ]),
        ),
        drawer: const AdvanceDrawer(),
        body: const TabBarView(children: [
          HomeScreen(),
          SportScreen(),
          BusinessNewScreen(),
          ScienceNewScreen(),
          TechNewScreen(),
          BioNews(),
          EntertainmentNewScreen(),
        ]),
      ),
    );
  }
}
