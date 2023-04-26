import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_2/models/news.dart';
import 'package:news_app_2/widgets/news_tile.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/search-screen";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController searchText = TextEditingController();
  List news = [];
  final dio = Dio();

  void getNews(String text) async{
    if(text.isEmpty){
      return;
    }
    else{
      List tempList = [];
      final response = await dio.get("https://newsapi.org/v2/everything?q=$text&apiKey=8624a6fc3d0f435499088d9f2103f33d");
      final extractedArticles = response.data['articles'];
      for(Map<String, dynamic> a in extractedArticles){
        tempList.add(News(
            title: a['title'] ?? 'Latest News!',
            description: a['description'] ?? 'This is the default description',
            content: a['content'] ?? 'This is the default content',
            imageUrl: a['urlToImage'] ??
                'https://i.picsum.photos/id/1073/5472/3648.jpg?hmac=xCDetU9pLnLGZopbvHOQOkQRhTiYwyrzWc0YyHPzp5Y',
            link: a['url'])
        );
      }
      setState((){
        news = tempList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: TextFormField(
          controller: searchText,
          decoration: InputDecoration(
            hintText: "Search here",
            icon: IconButton(
                onPressed: () {
                  getNews(searchText.text);
                },
                icon: const Icon(Icons.search))
          ),
          validator: (value){
            if(value == null){
              return "Cannot have empty value to search!";
            }
          },
        ),
      ),
      body: news.isEmpty? const Center(child: Text("Nothing to show here..."),)
          : ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, i){
          return NewsTile(news[i]);
        },
        itemCount: news.length,
      ) ,
    );
  }
}
