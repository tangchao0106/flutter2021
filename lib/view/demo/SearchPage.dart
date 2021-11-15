import 'package:flutter/material.dart';
import 'package:untitled/network/http_request.dart';
import 'package:untitled/network/http_config.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  int _num = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttpHotKey();
  }

  @override
  Widget build(BuildContext context) {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map?;
    print(arguments);
    var string = arguments!['key'].toString();
    print(string);

    return Scaffold(
        appBar: AppBar(
          title: Text("InheritedWidget=传参$string"),
        ),
        body: ShareWidget(
          num: _num,
          child: Container(
            color: Colors.amber,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyWidget(),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _num++;
                      });
                    },
                    child: Text("+1"))
              ],
            ),
          ),
        ));
  }

  void getHttpHotKey() async {
    HttpRequest.request(HOT_KEY).then((value) {
      print("runtimeType");
      print(value.runtimeType);
      print("value==$value");
    }).catchError((error) {});
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      ShareWidget.of(context).num.toString(),
      style: TextStyle(fontSize: 30),
    );
  }
}

class shareData extends InheritedWidget {
  shareData({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class ShareWidget extends InheritedWidget {
  final int? num;

  ShareWidget({Key? key, required Widget child, @required this.num})
      : super(key: key, child: child);

  // InheritedWidget是又子组件通过content向树上方查找数据
  static ShareWidget of(BuildContext context) {
    final ShareWidget? result = context
        .dependOnInheritedWidgetOfExactType<ShareWidget>(); //根据上下文得到具体的数据
    assert(result != null, 'No share found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ShareWidget old) {
    //通知组件去更新
    return true;
  }
}
