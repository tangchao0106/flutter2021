import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleDetail extends StatelessWidget {
  String? url, title;

  ArticleDetail({Key? key, @required this.url, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Theme.of(context).primaryColor),
      home: WebviewScaffold(
        url: 'www.mi.com',
        appBar: AppBar(
          title: Text("WebviewScaffold"),
        ),
        withZoom: true,
        withLocalStorage: true,
        hidden: true,
        initialChild: Container(
          color: Colors.redAccent[100],
          child: const Center(
            child: Text('Waiting.....'),
          ),
        ),
      ),
    );
  }
}
