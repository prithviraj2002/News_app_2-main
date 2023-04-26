import 'package:flutter/material.dart';
import 'package:news_app_2/models/saved_articles.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/news.dart';

class NewsTile extends StatefulWidget {
  News n;
  NewsTile(this.n, {Key? key}) : super(key: key);

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  bool isSaved = false;

  void toggleSave() {
    setState(() {
      isSaved = !isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onLongPress: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text('Save artilce?'),
                      content: const Text(
                          'This article will be saved in your saved articles list! Find the saved articles list in the drawer to your left!'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Provider.of<savedArticles>(context, listen: false)
                                  .saveArticle(widget.n);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: Colors.red),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(color: Colors.red),
                            )),
                      ],
                    ));
          },
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                      elevation: 5,
                      insetPadding: const EdgeInsets.symmetric(
                          vertical: 100, horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.cancel_sharp,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: widget.n.imageUrl == null? Image.asset("assets/images/defaultnews.jpg") :
                                  Image(image: NetworkImage(widget.n.imageUrl)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                widget.n.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Divider(color: Colors.red),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                widget.n.description,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(widget.n.content,
                                  style: const TextStyle(fontSize: 14)),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text("Read more here",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: GestureDetector(
                                child: Text(widget.n.link,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                    )),
                                onTap: () {
                                  final url = Uri.parse(widget.n.link);
                                  launchUrl(url);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ));
          },
          leading: Padding(
            padding: const EdgeInsets.all(5),
            child: Image(image: NetworkImage(widget.n.imageUrl)),
          ),
          title: Text(
            widget.n.title,
            softWrap: true,
            style: const TextStyle(overflow: TextOverflow.fade),
          ),
          dense: true,
        ),
        const Divider()
      ],
    );
  }
}
