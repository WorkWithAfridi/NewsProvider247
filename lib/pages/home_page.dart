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
  String filter = 'science';

  void getData() {
    NewsProvider newsProvider =
        Provider.of<NewsProvider>(context, listen: false);
    newsProvider.getNews(filter);
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
      backgroundColor: backgroundColor,
      body: Consumer<NewsProvider>(builder: (context, provider, childProperty) {
        return provider.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
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
                              Colors.black.withOpacity(1),
                              Colors.black.withOpacity(.25),
                              Colors.black.withOpacity(.4),
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
                            height: 70,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.changingFilter = true;

                                    setState(() {
                                      filter = 'science';
                                    });
                                    getData();
                                  },
                                  child: Chip(
                                    elevation: 6,
                                    backgroundColor: filter == 'science'
                                        ? primaryColor
                                        : backgroundColor,
                                    label: Text(
                                      'Science',
                                      style: postTitle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.changingFilter = true;
                                    setState(() {
                                      filter = 'business';
                                    });
                                    getData();
                                  },
                                  child: Chip(
                                    elevation: 6,
                                    backgroundColor: filter == 'business'
                                        ? primaryColor
                                        : backgroundColor,
                                    label: Text(
                                      'Business',
                                      style: postTitle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.changingFilter = true;
                                    setState(() {
                                      filter = 'general';
                                    });
                                    getData();
                                  },
                                  child: Chip(
                                    elevation: 6,
                                    backgroundColor: filter == 'general'
                                        ? primaryColor
                                        : backgroundColor,
                                    label: Text(
                                      'General',
                                      style: postTitle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.changingFilter = true;
                                    setState(() {
                                      filter = 'health';
                                    });
                                    getData();
                                  },
                                  child: Chip(
                                    elevation: 6,
                                    backgroundColor: filter == 'health'
                                        ? primaryColor
                                        : backgroundColor,
                                    label: Text(
                                      'Health',
                                      style: postTitle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.changingFilter = true;
                                    setState(() {
                                      filter = 'entertainment';
                                    });
                                    getData();
                                  },
                                  child: Chip(
                                    elevation: 6,
                                    backgroundColor: filter == 'entertainment'
                                        ? primaryColor
                                        : backgroundColor,
                                    label: Text(
                                      'Entertainment',
                                      style: postTitle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.changingFilter = true;
                                    setState(() {
                                      filter = 'sports';
                                    });
                                    getData();
                                  },
                                  child: Chip(
                                    elevation: 6,
                                    backgroundColor: filter == 'sports'
                                        ? primaryColor
                                        : backgroundColor,
                                    label: Text(
                                      'Sports',
                                      style: postTitle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    provider.changingFilter = true;
                                    setState(() {
                                      filter = 'technology';
                                    });
                                    getData();
                                  },
                                  child: Chip(
                                    elevation: 6,
                                    backgroundColor: filter == 'technology'
                                        ? primaryColor
                                        : backgroundColor,
                                    label: Text(
                                      'Teachnology',
                                      style: postTitle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .35,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.transparent,
                          ),
                          getBannerDetails(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: provider.changingFilter
                                ? LinearProgressIndicator(
                                    color: primaryColor,
                                  )
                                : Divider(
                                    thickness: 2,
                                  ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Top Stories',
                                        style: header.copyWith(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.sort,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  color: primaryColor,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // decoration: BoxDecoration(
                            //   // color: backgroundColor,
                            //   borderRadius: BorderRadius.only(
                            //     topLeft: Radius.circular(15),
                            //     topRight: Radius.circular(15),
                            //   ),
                            // ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
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
                  style: header.copyWith(color: Colors.white, fontSize: 15),
                ),
                color: primaryColor,
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
                        provider.responseApiModel.articles![0].source!.name
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
                          FontAwesomeIcons.thumbsUp,
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
      print(
        provider.responseApiModel.articles![0].urlToImage.toString(),
      );
      return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: provider.responseApiModel.articles![0].urlToImage.toString() ==
                'null'
            ? Center(
              child: CircularProgressIndicator(
                  color: primaryColor,
                ),
            )
            : Image.network(
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
      child: Card(
        elevation: 10,
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child:
            Consumer<NewsProvider>(builder: (context, provider, childProperty) {
          return Container(
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: provider
                                  .responseApiModel.articles![index].urlToImage
                                  .toString() ==
                              'null'
                          ? Center(child: CircularProgressIndicator( color: primaryColor,))
                          : Image.network(
                              provider
                                  .responseApiModel.articles![index].urlToImage
                                  .toString(),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              provider
                                  .responseApiModel.articles![index].description
                                  .toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: postDescription.copyWith(
                                  fontSize: 14, color: Colors.white60),
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
                                    style: author.copyWith(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  Text(
                                    provider.responseApiModel.articles![index]
                                        .source!.name
                                        .toString(),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: publisher.copyWith(
                                        color: Colors.white60, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      Icon(Icons.bookmark, color: Colors.white),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(FontAwesomeIcons.thumbsUp,
                                      color: Colors.white),
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
          );
        }),
      ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'NewsProvider 247',
                    style: titleTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      Text(
                        'Canada',
                        style: postContent.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
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
