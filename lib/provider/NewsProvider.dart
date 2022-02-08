import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:newprovider247/model/ResponseAPI_model.dart';
import 'package:newprovider247/resources/global_variables.dart';

class NewsProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _changingFilter = false;

  bool get changingFilter => _changingFilter;

  set changingFilter(bool value) {
    _changingFilter = value;
    notifyListeners();
  }

  bool showAlertBox = false;
  late ResponseApiModel responseApiModel;
  void getNews(String filter) async {
    print('getData');
    print(filter);
    String url =
        'https://newsapi.org/v2/top-headlines?country=ca&category=${filter}&apiKey=${APIKey}';
    try {
      Response response = await get(Uri.parse(url));
      String responseData = response.body;
      responseApiModel = ResponseApiModel.fromJson(jsonDecode(responseData));
      // Future.delayed(Duration(seconds: 1));
      isLoading=false;
      changingFilter=false;
      notifyListeners();
    } catch (e) {
      print('An error occurred.');
    }
  }
}
