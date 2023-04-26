import 'package:flutter/material.dart';
import 'package:news_app_2/models/saved_articles.dart';
import 'package:news_app_2/screens/tab_bar_screen.dart';
import 'package:news_app_2/widgets/news_tile.dart';
import 'package:provider/provider.dart';

class SavedArticlesList extends StatefulWidget {
  static const routeName = '/saved-articles-page';
  SavedArticlesList({Key? key}) : super(key: key);

  @override
  State<SavedArticlesList> createState() => _SavedArticlesListState();
}

class _SavedArticlesListState extends State<SavedArticlesList> {
  @override
  Widget build(BuildContext context) {
    final savedNewsArticles =
        Provider.of<savedArticles>(context, listen: false).savedItems;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Saved Articles',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      drawer: Drawer(
            elevation: 5,
            semanticLabel: 'News App',
            child: ListView(
              children: [
                Container(
                  height: 50,
                  child: const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.only(bottom: 0),
                    child: Center(
                      child: Text(
                        'News App',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
                ListTile(
                    title: const Text('Home'),
                    leading: const Icon(
                      Icons.home,
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(TabBarScreen.routeName);
                    }),
                const Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
                ListTile(
                  title: const Text('Your saved articles'),
                  leading: const Icon(
                    Icons.save,
                    color: Colors.red,
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(SavedArticlesList.routeName);
                  },
                ),
                const Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
                ListTile(
                  title: const Text('Log out'),
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              elevation: 5,
                              title: const Text('LogOut?'),
                              content: SingleChildScrollView(
                                  child: ListBody(
                                children: const [
                                  Text('Are you sure want to logout?'),
                                ],
                              )),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'No',
                                      style: TextStyle(color: Colors.red),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Yes',
                                        style: TextStyle(color: Colors.red)))
                              ],
                            ));
                  },
                ),
                const Divider(
                  color: Colors.black38,
                  thickness: 1,
                ),
              ],
            )),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Expanded(
            child: ListView.builder(
                itemBuilder: (ctx, i) => NewsTile(savedNewsArticles[i]),
                itemCount: savedNewsArticles.length,)),
      ),
    );
  }
}
