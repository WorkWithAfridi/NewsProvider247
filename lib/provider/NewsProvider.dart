import 'package:flutter/cupertino.dart';
import 'package:newprovider247/model/ResponseAPI_model.dart';
import 'package:newprovider247/resources/global_variables.dart';

class NewsProvider extends ChangeNotifier {
  bool isLoading = true;
  bool showAlertBox = false;
  late ResponseApiModel responseApiModel;
  void getNews() {
    String url =
        'https://newsapi.org/v2/top-headlines?country=au&category=business&apiKey=${APIKey}';
    try {} catch (e) {
      print('An error occurred.');
    }
  }
}
