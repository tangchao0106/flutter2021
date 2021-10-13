import 'package:flutter/material.dart';
import 'package:untitled/view/demo/Demo0929Page.dart';
import 'package:untitled/view/demo/Demo0930Page.dart';
import 'package:untitled/view/demo/Demo1009.dart';
import 'package:untitled/view/demo/Demo1010.dart';
import 'package:untitled/view/demo/Demo3Page.dart';
import 'package:untitled/view/demo/Demo4Page.dart';
import 'SecondePage.dart';

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
                    builder: (context) => Demo2(todos[index]))),
              )),
    );
  }
}

class Demo2 extends StatelessWidget {
  final _Todo todo;

  Demo2(@required this.todo);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${todo.title}",
              ),
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
              MaterialButton(onPressed: ()=>{
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Demo1010()))

              },child: Text("1010container约束"),)
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
