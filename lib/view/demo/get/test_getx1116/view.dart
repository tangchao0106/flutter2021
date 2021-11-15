import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TestGetx1116Page extends StatelessWidget {
  final logic = Get.put(TestGetx1116Logic());
  final state = Get.find<TestGetx1116Logic>().state;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FlutterLogo(
            size: 40,
          ),
          Form(
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("账号"),
                  hintText: "账号",
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("账号"),
                  hintText: "账号",
                ),
              ),
              // FadeInImage.assetNetwork(placeholder: placeholder, image: image)
            ],
          ))
        ],
      ),
    );
  }
}
