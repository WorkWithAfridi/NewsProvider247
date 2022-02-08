import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newprovider247/pages/article_page.dart';
import 'package:newprovider247/resources/global_variables.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                'https://images.unsplash.com/photo-1530549387789-4c1017266635?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                fit: BoxFit.fitHeight,
              ),
            ),
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
                    begin: Alignment.topLeft, //begin of the gradient color
                    end: Alignment.bottomRight, //end of the gradient color
                    stops: [0, 0.2, 0.5, 0.8] //stops for individual color
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
                  Container(
                    // color: Colors.pink,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5),
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
                            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis.',
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
                                    'Author',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: author,
                                  ),
                                  Text(
                                    'Publisher',
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
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return getPost();
                      },
                    ),
                  ),
                ],
              ),
            ),
            getAppBar(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.75),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.rssSquare,
                // color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.bookmark,
                // color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.edit,
                // color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.bell,
                // color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.user,
                // color: Colors.black,
              ),
              label: ''),
        ],
      ),
    );
  }

  Widget getPost() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticlePage(),
          ),
        );
      },
      child: Column(
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
                      'https://images.unsplash.com/photo-1510925758641-869d353cecc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
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
                        Text(
                          'Post Title',
                          style:
                              postTitle.copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: postTitle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Author',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: author.copyWith(color: Colors.black),
                                ),
                                Text(
                                  'Publisher',
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
