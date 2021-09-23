import 'package:flutter/material.dart';

import 'cpn/ProductItem.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "标题20210919", //后台切换时候标题
        home: Scaffold(
            //脚手架
            appBar: AppBar(
              title: Text("我是导航栏"),
            ),
            body: TextFieldDemo2()));
  }
}

class TextFieldDemo2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TextFieldDemo2();
}

class _TextFieldDemo2 extends State<TextFieldDemo2> {
  late String username, password;

  // GlobalKey 抽象类里面不能实例-里面有工厂方法
  //1调用Form save方法 会触发里面TextFormField里面的onsave方法
  final registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              //自动校验
              autovalidate: true,
                decoration:
                    InputDecoration(icon: Icon(Icons.people), labelText: "用户名"),
                onSaved: (value) {
                  this.username = value!;
                },
                validator: (value) {
                  if (value == null || value.length == 0) {
                    return "用户名不能为空";
                  } else {
                    return null;
                  }
                }),
            TextFormField(
              decoration:
                  InputDecoration(icon: Icon(Icons.people), labelText: "密码"),
              onSaved: (value) {
                this.password = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              // padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              height: 44,
              child: ElevatedButton(
                child: Text(
                  "注册",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                onPressed: () {
                  print("点击了注册");
                  registerFormKey.currentState!.save();
                  registerFormKey.currentState!.validate();
                },
              ),
            )
          ],
        ));
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextFieldDemoState();
  }
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = "Controller默认值";

    textEditingController.addListener(() {
      print("textEditingController ${textEditingController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              labelText: "username", hintText: "输入用户名", filled: true),
          onChanged: (value) {
            print("onChanged $value");
          },
          onSubmitted: (value) {
            print("onSubmitted  $value");
          },
          controller: textEditingController,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "password", hintText: "输入密码", filled: true),
          onChanged: (value) {
            print("onChanged $value");
          },
          onSubmitted: (value) {
            print("onSubmitted  $value");
          },
          controller: textEditingController,
        ),
      ],
    );
  }
}

class Mystateful extends StatefulWidget {
  @override
  _MystatefulState createState() => _MystatefulState();
}

class _MystatefulState extends State<Mystateful> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: Text(
                  "+1",
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  setState(() {
                    count++;
                  });
                }),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
                child: Text(
                  "-1",
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: () {
                  setState(() {
                    count--;
                  });
                })
          ],
        ),
        Text(
          "当前计数$count",
          style: TextStyle(fontSize: 30),
        ),
      ],
    ));
  }
}

class HomeContent2 extends StatelessWidget {
  const HomeContent2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(border: Border.all()),
        child: ListView(children: [
          // ProductItem("标题", "dec",
          //     "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
          // ProductItem("标题", "dec",
          //     "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
          // ProductItem("标题", "dec",
          //     "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
          Image.asset("assets/images/image.png"),
          Image.asset("assets/images/2.png")
        ]),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: true, onChanged: (value) => {print("value=$value")}),
          Text(
            "同意协议",
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 20),
          ),
          Image.network(
              "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg")
        ],
      ),
    );
  }
}
