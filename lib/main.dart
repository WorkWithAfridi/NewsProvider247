import 'package:flutter/material.dart';
import 'package:newprovider247/pages/home_page.dart';
import 'package:newprovider247/provider/NewsProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>NewsProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName : (context) => HomePage(),
        },
      ),
    );
  }
}
