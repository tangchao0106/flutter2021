import 'package:flutter/material.dart';
import 'package:untitled/view/demo/Demo0929Page.dart';
import 'package:untitled/view/demo/Demo0930Page.dart';
import 'package:untitled/view/demo/Demo1009.dart';
import 'package:untitled/view/demo/Demo1010.dart';
import 'package:untitled/view/demo/Demo1013.dart';
import 'package:untitled/view/demo/Demo1015.dart';
import 'package:untitled/view/demo/Demo1018.dart';
import 'package:untitled/view/demo/Demo1020.dart';
import 'package:untitled/view/demo/Demo1022.dart';
import 'package:untitled/view/demo/Demo1025.dart';
import 'package:untitled/view/demo/Demo1029.dart';
import 'package:untitled/view/demo/Demo1031.dart';
import 'package:untitled/view/demo/Demo3Page.dart';
import 'package:untitled/view/demo/Demo4Page.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _SamplePagehome(),
    );
  }
}

class _Todo {
  final String title;
  final String description;

  _Todo(this.title, this.description);
}

class _SamplePagehome extends StatelessWidget {
  final todos =
      List.generate(20, (index) => _Todo('toto$index', "aaaaaaaaaaaa"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => {Navigator.of(context).pop()},
        ),
        title: Text("ListView"),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(todos[index].title),
                subtitle: Text(todos[index].description),
                onLongPress: () => {print("onLongPressonLongPress")},
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Demo2())),
              )),
    );
  }
}

class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("传递参数页面"),
          leading: CloseButton(
            onPressed: () => {Navigator.of(context).pop()},
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [

              ElevatedButton(
                  onPressed: () async {
                    String result =
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Demo3Page(
                                  title: "Demo3Page",
                                )));
                  },
                  child: Text("带有参数返回")),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Demo4Page())),
                  child: Image.asset(
                    "assets/images/image.png",
                    width: 40,
                    height: 20,
                    fit: BoxFit.fill,
                  )),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Demo0929Page())),
                      },
                  child: Text("20210929")),
              const Divider(
                height: 20,
                thickness: 5,
                color: Colors.red,
              ),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Demo0930Page(title: "0930")))
                      },
                  child: Text("0930")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Demo4()))
                      },
                  child: Text("09301")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Demo1009()))
                      },
                  child: Text("1009")),
              MaterialButton(
                onPressed: () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Demo1010()))
                },
                child: Text("1010container约束"),
                color: Colors.red[100],
              ),
              // <image src="https://img-shop.qmimg.cn/s23107/2020/04/27/0039bf41c9ebd50a2c.jpg"></image>
              MaterialButton(
                onPressed: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Demo1013(
                            title: "Demo1013",
                          )))
                },
                child: Image.network(
                  "https://img-shop.qmimg.cn/s23107/2020/04/27/0039bf41c9ebd50a2c.jpg",
                  fit: BoxFit.fill,
                  width: 50,
                  height: 50,
                ),
                color: Colors.yellowAccent,
              ),
              OutlinedButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Demo1015(
                                  title: "1015",
                                )))
                      },
                  child: Text("Demo1015")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Demo1018(
                                  title: "1018",
                                )))
                      },
                  child: Text("DEMO1018")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Demo1020(title: "1020动画")))
                      },
                  child: Text("Demo1020")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TestView1022())),
                      },
                  child: Text("1022布局")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Demo1025()))
                      },
                  child: Text("1025布局")),
              TextButton(
                  onPressed: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Demo1029()))
                      },
                  child: Text("1029STACK")),
              TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Demo1031(
                              title: "1031",
                            )));
                  },
                  icon: Icon(Icons.accessibility_sharp),
                  label: Text("1031"))
              // Scaffold.of(context)
              // ..removeCurrentSnackBar()
              // ..showSnackBar(SnackBar(content: Text("$result")));
            ],
          ),
        ),
      ),
    );
  }
}

class Demo1 extends StatelessWidget {
  const Demo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: [
          RaisedButton(
              child: Text("返回上一个页面"),
              onPressed: () => Navigator.of(context).pop()),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
