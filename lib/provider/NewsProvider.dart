import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:newprovider247/model/ResponseAPI_model.dart';
import 'package:newprovider247/resources/global_variables.dart';

class NewsProvider extends ChangeNotifier {
  bool isLoading = true;
  bool showAlertBox = false;
  late ResponseApiModel responseApiModel;
  void getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=ca&category=business&apiKey=${APIKey}';
    try {
      Response response = await get(Uri.parse(url));
      String responseData = response.body;
      responseApiModel = ResponseApiModel.fromJson(jsonDecode(responseData));
      Future.delayed(Duration(seconds: 1));
      isLoading=false;
      notifyListeners();
    } catch (e) {
      print('An error occurred.');
    }
  }
}
