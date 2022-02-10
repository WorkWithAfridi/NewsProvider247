import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class OpenWebView extends StatefulWidget {
  static const routeName = '/web_view';
  const OpenWebView({Key? key}) : super(key: key);

  @override
  State<OpenWebView> createState() => _OpenWebViewState();
}

class _OpenWebViewState extends State<OpenWebView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String url = routeArgs['Url'];
    print(url);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
            backgroundColor: Colors.black,
            ),
      ),
      backgroundColor: Colors.black54,
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: WebView(
            zoomEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: url,
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            // backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              'Close?',
            ),
            content: Text(
              'Are you sure, you want to close this window?',
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
