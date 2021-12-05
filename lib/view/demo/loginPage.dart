import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:untitled/network/http_config.dart';
import 'package:untitled/network/http_request.dart';
import 'package:untitled/view/demo/SearchPage.dart';
import 'package:share/share.dart';
import 'package:logger/logger.dart';
import 'bean/UserEntity.dart';
import 'get/index_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  void showMyCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return new CupertinoAlertDialog(
            title: new Text("Go TO InheritedWidget"),
            content: new Text("message"),
            actions: <Widget>[
              new TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => IndexPage()));
                },
                child: new Text("确认"),
              ),
              new TextButton(
                onPressed: () {
                  // Navigator.of(context).pop("点击了取消");
                  Share.share('check out my website https://example.com');
                },
                child: new Text("取消"),
              ),
            ],
          );
        });
  }

  Widget dialog = CupertinoAlertDialog(
    title: Text("title"),
    content: Text("content"),
    actions: [
      CupertinoDialogAction(
        child: Text("确定"),
        onPressed: () {},
      ),
      CupertinoDialogAction(
        child: Text("取消"),
        onPressed: () {},
      ),
    ],
  );
  String bottomText = "没有账号？注册";
  String btnText = "登录";
  GlobalKey<FormState> _key = GlobalKey();
  bool visible = true;
  bool autovalidate = false;
  String? username = "";
  String? password = "";
  String? rePassword = "";

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: Theme.of(context).primaryColor,
          accentColor: Theme.of(context).accentColor,
          primaryColorDark: Theme.of(context).primaryColorDark),
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).accentColor,
            Theme.of(context).primaryColor,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: getBodyView(),
        ),
      ),
    );
  }

  Widget getBodyView() {
    return ListView(
      children: [
        SizedBox(
          height: 80,
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Card(
                elevation: 5,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    autovalidate: autovalidate,
                    key: _key,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person_outline),
                            labelText: "请输入账号",
                          ),
                          onSaved: (text) {
                            setState(() {
                              username = text;
                            });
                          },
                          validator: validatorName,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock_outline),
                            labelText: "请输入密码",
                          ),
                          onSaved: (text) {
                            setState(() {
                              password = text;
                            });
                          },
                          validator: validatorPassword,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Offstage(
                          offstage: visible,
                          child: Column(
                            children: [
                              TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.lock_outline),
                                    labelText: "请确认密码"),
                                onSaved: (text) {
                                  setState(() {
                                    rePassword = text;
                                  });
                                },
                                validator: validatorPassword,
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 20,
                left: MediaQuery.of(context).size.width / 2 - 35,
                child: Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/images/wm.png")),
                      boxShadow: [
                        BoxShadow(
                          //左右、上下阴影的距离
                          offset: Offset(0, 0),
                          //阴影颜色
                          color: Colors.grey,
                          //模糊距离
                          blurRadius: 8,
                          //不模糊距离
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                bottom: 0,
                left: 80,
                right: 80,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  elevation: 5,
                  highlightElevation: 10,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                          Theme.of(context).accentColor,
                          Theme.of(context).primaryColorDark
                        ]),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    padding: EdgeInsets.all(10),
                    child: Text(btnText),
                  ),
                  onPressed: () {
                    doRequest();

                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      doRequest();
                    } else {
                      setState(() {
                        autovalidate = true;
                      });
                    }
                  },
                ))
          ],
        ),
        GestureDetector(
          child: Text(
            bottomText,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            setState(() {
              if (visible) {
                btnText = "注册";
                visible = false;
                bottomText = "已有账号";
              } else {
                btnText = "登录";
                visible = true;
                bottomText = "没有账号？注册";
              }
            });
          },
        )
      ],
    );
  }

  String? validatorName(String? value) {
    if (value!.isEmpty) {
      return "用户名不为空";
    }
    return null;
  }

  String? validatorPassword(String? value) {
    if (value!.isEmpty) {
      return "密码不能为空";
    }
    return null;
  }

  void doRequest() {
    var userentity;
    var data = {
      'username': "15951613060",
      'password': "15951613060",
      'repassword': rePassword
    };
    print(data);
    Future future = HttpRequest.request(user, data: data);
    future.then((value) {
      print(value.runtimeType);
      userentity = UserEntity.fromJson(value);
      print(userentity.errorMsg);
      print(userentity.errorCode);
      // Map<String, dynamic> user = JSON.decode(json);

      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchPage()));
    });
    // CupertinoAlertDialog(
    //   title: Text("doRequest"),
    //   content: Text(userentity.errorMsg.toString()),
    // );
    // String s=userentity.errorMsg.toString();
    // print(s);
    // showToast(s);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
    var logger = Logger();
    logger.d("data==$data");
    logger.d('Log message with 2 methods');
    var loggerNoStack = Logger(
      printer: PrettyPrinter(methodCount: 0),
    );

    // loggerNoStack.i('Info message');
    //
    // loggerNoStack.w('Just a warning!');
    //
    // logger.e('Error! Something bad happened', 'Test Error');
    //
    // loggerNoStack.v({'key': 5, 'value': 'something'});
    //
    // Logger(printer: SimplePrinter(colors: true)).v('boom');
    showMyCupertinoDialog(context);
  }

  void showToast(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
