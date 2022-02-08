import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';
import 'package:newprovider247/provider/NewsProvider.dart';
import 'package:provider/provider.dart';

import '../resources/global_variables.dart';

class ArticlePage extends StatefulWidget {
  final int index;
  const ArticlePage({Key? key, required this.index}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'News Provider 247',
            style: titleTextStyle,
          ),
        ),
      ),
      body: Consumer<NewsProvider>(builder: (context, provider, childProperty) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(FontAwesomeIcons.arrowLeft),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.responseApiModel
                                      .articles![widget.index].author
                                      .toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: author.copyWith(
                                      color: Colors.black, fontSize: 25),
                                ),
                                Text(
                                  provider.responseApiModel
                                      .articles![widget.index].source!.name
                                      .toString(),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      publisher.copyWith(color: Colors.black),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.bookmark,
                                    color: Colors.black,
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    FontAwesomeIcons.ellipsisV,
                                    size: 20,
                                  ),
                                ),
                                // IconButton(
                                //   onPressed: () {},
                                //   icon: Icon(
                                //     Icons.expand,
                                //     color: Colors.black,
                                //   ),
                                // ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Text(
                          provider
                              .responseApiModel.articles![widget.index].title
                              .toString(),
                          // maxLines: 2,

                          style: postTitle.copyWith(
                              height: .9,
                              color: Colors.black87,
                              fontSize: 35,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        height: MediaQuery.of(context).size.height * .35,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          provider.responseApiModel.articles![widget.index]
                              .urlToImage
                              .toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Text(
                          HtmlUnescape().convert(provider.responseApiModel
                              .articles![widget.index].description
                              .toString()),
                          // maxLines: 2,
                          style: postTitle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Text(
                          provider.responseApiModel.articles![widget.index]
                              .publishedAt
                              .toString()
                              .substring(0, 10),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: publisher.copyWith(color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Text(
                          provider
                              .responseApiModel.articles![widget.index].content
                              .toString(),
                          // maxLines: 2,
                          style: postTitle.copyWith(
                              color: Colors.black.withOpacity(.6),
                              fontSize: 20,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        child: Text(
                          'Open in webview.', // maxLines: 2,
                          style: postTitle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.red),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
