import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2/models/business_news.dart';
import 'package:news_app_2/models/entertainment_news.dart';
import 'package:news_app_2/models/health_news.dart';
import 'package:news_app_2/models/news_api.dart';
import 'package:news_app_2/models/saved_articles.dart';
import 'package:news_app_2/models/science_news.dart';
import 'package:news_app_2/models/search_news_provider.dart';
import 'package:news_app_2/models/sports_news.dart';
import 'package:news_app_2/models/tech_news.dart';
import 'package:news_app_2/screens/login-screen.dart';
import 'package:news_app_2/screens/saved_articles_screen.dart';
import 'package:news_app_2/screens/search_screen.dart';
import 'package:news_app_2/screens/signup-screen.dart';
import 'package:news_app_2/screens/splash_screen.dart';
import 'package:news_app_2/screens/tab_bar_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => NewsArticles(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => SportsNews(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TechNews(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => BusinessNews(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => EntertainmentNews(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => HealthNews(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ScienceNews(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => savedArticles(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => searchedNews(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const Splash(),
        routes: {
          TabBarScreen.routeName: (ctx) => const TabBarScreen(),
          SavedArticlesList.routeName: (ctx) => SavedArticlesList(),
          SearchScreen.routeName: (ctx) => SearchScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignUp.routeName: (ctx) => SignUp()
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
