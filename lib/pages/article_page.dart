import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:newprovider247/pages/open_webview.dart';
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
  Container getAppBar() {
    return Container(
      height: 70,
      // color: Colors.white,

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(.0),
            Colors.black.withOpacity(.5),
            Colors.black.withOpacity(.7),
            Colors.black.withOpacity(.9),
            //add more colors for gradient
          ],
          begin: Alignment.bottomCenter, //begin of the gradient color
          end: Alignment.topCenter, //end of the gradient color
          // stops: [0, 0.2, 0.5, 0.8] //stops for individual color
          //set the stops number equal to numbers of color
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  FontAwesomeIcons.chevronCircleLeft,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'NewsProvider 247',
                    style: titleTextStyle,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Icon(
                  //       Icons.arrow_drop_down,
                  //       color: Colors.white,
                  //     ),
                  //     Text(
                  //       'Canada',
                  //       style: postContent.copyWith(
                  //           color: Colors.white,
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.w400),
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     )
                  //   ],
                  // )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.transparent,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 6,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            'News Provider 247',
            style: titleTextStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Consumer<NewsProvider>(builder: (context, provider, childProperty) {
        return Stack(
          children: [
            Container(
              // padding:
              //     EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                provider.responseApiModel.articles![widget.index].urlToImage
                    .toString(),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(1),
                      Colors.black.withOpacity(.25),
                      Colors.black.withOpacity(.4),
                      Colors.black.withOpacity(.9),
                      //add more colors for gradient
                    ],
                    begin: Alignment.topLeft, //begin of the gradient color
                    end: Alignment.bottomRight, //end of the gradient color
                    stops: [0, 0.2, 0.5, 0.8] //stops for individual color
                    //set the stops number equal to numbers of color
                    ),
              ),
            ),
            // Container(
            //   // padding:
            //   //     EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   color: backgroundColor.withOpacity(.15),
            // ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .45,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            elevation: 6,
                            color: backgroundColor,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.responseApiModel
                                        .articles![widget.index].title
                                        .toString(),
                                    // maxLines: 2,

                                    style: postTitle.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    provider.responseApiModel
                                        .articles![widget.index].publishedAt
                                        .toString()
                                        .substring(0, 10),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: publisher.copyWith(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              provider
                                                  .responseApiModel
                                                  .articles![widget.index]
                                                  .author
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  author.copyWith(fontSize: 18),
                                            ),
                                            Text(
                                              provider
                                                  .responseApiModel
                                                  .articles![widget.index]
                                                  .source!
                                                  .name
                                                  .toString(),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: publisher.copyWith(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.bookmark,
                                                color: Colors.white,
                                              ),
                                            ),

                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: Icon(
                                                FontAwesomeIcons.thumbsUp,
                                                color: Colors.white,
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
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 6,
                            color: backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                HtmlUnescape().convert(provider.responseApiModel
                                    .articles![widget.index].description
                                    .toString()),
                                // maxLines: 2,
                                style: postContent.copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 6,
                            color: backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                provider.responseApiModel
                                    .articles![widget.index].content
                                    .toString(),
                                // maxLines: 2,
                                style: postDescription.copyWith(
                                    color: Colors.white.withOpacity(.6),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Navigator.of(context).pushNamed(
                                      OpenWebView.routeName,
                                      arguments: {
                                        'Url': provider.responseApiModel
                                            .articles![widget.index].url
                                      });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  child: Text(
                                    'Learn more',
                                    style: header.copyWith(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            getAppBar(),
          ],
        );
      }),
    );
  }
}
