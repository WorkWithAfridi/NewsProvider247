import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newprovider247/pages/article_page.dart';
import 'package:newprovider247/provider/NewsProvider.dart';
import 'package:newprovider247/resources/global_variables.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getData() {
    NewsProvider newsProvider =
        Provider.of<NewsProvider>(context, listen: false);
    newsProvider.getNews();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text(
            'News Provider 247',
            style: titleTextStyle,
          ),
        ),
      ),
      body: Consumer<NewsProvider>(builder: (context, provider, childProperty) {
        return provider.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    getBannerImage(context),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.orange.withOpacity(0),
                              Colors.orangeAccent.withOpacity(.05),
                              Colors.black87.withOpacity(.25),
                              Colors.black.withOpacity(.9),
                              //add more colors for gradient
                            ],
                            begin:
                                Alignment.topLeft, //begin of the gradient color
                            end: Alignment
                                .bottomRight, //end of the gradient color
                            stops: [
                              0,
                              0.2,
                              0.5,
                              0.8
                            ] //stops for individual color
                            //set the stops number equal to numbers of color
                            ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .55,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                          ),
                          getBannerDetails(),
                          Container(
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  provider.responseApiModel.articles?.length,
                              itemBuilder: (context, index) {
                                return getPost(index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    getAppBar(),
                  ],
                ),
              );
      }),
      // bottomNavigationBar: BottomNavigationBar(
      //   showSelectedLabels: false,
      //   showUnselectedLabels: false,
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.black.withOpacity(.75),
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           FontAwesomeIcons.rssSquare,
      //           // color: Colors.black,
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           FontAwesomeIcons.bookmark,
      //           // color: Colors.black,
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           FontAwesomeIcons.edit,
      //           // color: Colors.black,
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           FontAwesomeIcons.bell,
      //           // color: Colors.black,
      //         ),
      //         label: ''),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           FontAwesomeIcons.user,
      //           // color: Colors.black,
      //         ),
      //         label: ''),
      //   ],
      // ),
    );
  }

  Widget getBannerDetails() {
    return Consumer<NewsProvider>(builder: (context, provider, childProperty) {
      return Container(
        // color: Colors.pink,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Trending',
                  style: author.copyWith(color: Colors.black87),
                ),
                color: Colors.yellow,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                provider.responseApiModel.articles![0].title.toString(),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: header,
              ),
              // SizedBox(
              //   height: 0,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.responseApiModel.articles![0].author
                            .toString(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: author,
                      ),
                      Text(
                        provider.responseApiModel.articles![0].source
                            .toString(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: publisher,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.bookmark,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.expand,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget getBannerImage(BuildContext context) {
    return Consumer<NewsProvider>(builder: (context, provider, childProperty) {
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.network(
          provider.responseApiModel.articles![0].urlToImage.toString(),
          fit: BoxFit.fitHeight,
        ),
      );
    });
  }

  Widget getPost(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticlePage(
              index: index,
            ),
          ),
        );
      },
      child:
          Consumer<NewsProvider>(builder: (context, provider, childProperty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: double.infinity,
              // color: Colors.red,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.network(
                        provider.responseApiModel.articles![index].urlToImage
                            .toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                provider.responseApiModel.articles![index].title
                                    .toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: postTitle.copyWith(
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                provider.responseApiModel.articles![index]
                                    .description
                                    .toString(),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: postDescription,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      provider.responseApiModel.articles![index]
                                          .author
                                          .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          author.copyWith(color: Colors.black),
                                    ),
                                    Text(
                                      provider.responseApiModel.articles![index]
                                          .source!.name
                                          .toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: publisher.copyWith(
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
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
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.expand,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 15,
              color: Colors.black,
            )
          ],
        );
      }),
    );
  }

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
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              Text(
                'NewsProvider247',
                style: titleTextStyle,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
