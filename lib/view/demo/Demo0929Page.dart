import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/view/demo/Demo0930Page.dart';

class Demo0929Page extends StatefulWidget {
  const Demo0929Page({Key? key}) : super(key: key);

  @override
  _Demo0929PageState createState() => _Demo0929PageState();
}

class _Demo0929PageState extends State<Demo0929Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("0929"),
      ),
      body: Demo2(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _toggle,
      // ),
    );
  }
}

class Demo2 extends StatelessWidget {
  Demo2({Key? key}) : super(key: key);

  final alist = List.generate(
      20,
      (index) => CustomListItem(
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          title: "titletitletitletitletitletitletitletitletitle",
          user: "user",
          viewcount: 99999));

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      itemExtent: 106,
      children: [
        CustomListItem(
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            title: "titletitletitletitletitletitletitletitletitle",
            user: "user",
            viewcount: 99999),
        CustomListItem(
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.red),
            ),
            title: "titletitletitletitletitletitletitletitletitle",
            user: "user",
            viewcount: 99999),
        CustomListItem(
            thumbnail: Container(
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            title: "titletitletitletitletitletitletitletitletitle",
            user: "user",
            viewcount: 99999),
        CustomListItem(
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.yellow),
            ),
            title: "titletitletitletitletitletitletitletitletitle",
            user: "user",
            viewcount: 99999),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Demo0930Page(
                      title: "0930",
                    )))
          },
          child: Text(
            "0930",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.pink,
        )
      ],
    );
  }
}

class Demo1 extends StatefulWidget {
  const Demo1({Key? key}) : super(key: key);

  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _gettoggleChild() {
    if (toggle) {
      return Text("tooggle");
    } else {
      return MaterialButton(
        onPressed: () => {Navigator.of(context).pop("MaterialButton")},
        child: Text("MaterialButton"),
        color: Colors.pink,
      );
    }
  }

  void imageselect() {
    final ImagePicker _pick = ImagePicker();
    _pick.pickImage(source: ImageSource.gallery);
  }

  @override
  void initState() {
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: _toggle,
            child: Text(
              "切换",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
          MaterialButton(
            onPressed: () => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "tishi",
                        textAlign: TextAlign.center,
                      ),
                      content: Text("content"),
                      actions: [
                        TextButton(
                          onPressed: () => {},
                          child: Text("取消"),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: Text("确定"),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: Text("确定1"),
                        ),
                      ],
                    );
                  })
            },
            child: Text(
              "提示框",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
          TextButton(
              onPressed: () => {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("ScaffoldMessenger.of(context)"),
                      backgroundColor: Colors.amber,
                      // duration: const Duration(microseconds: 10000),
                      action: SnackBarAction(
                        label: "label",
                        onPressed: () {},
                      ),
                      width: 280.0,
                      // Width of the SnackBar.
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, // Inner padding for SnackBar content.
                      ),
                      behavior: SnackBarBehavior.floating,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(10.0),
                      // ),
                    ))
                  },
              child: Text("SnackBar")),
          MaterialButton(
            onPressed: () => {
              SimpleDialog(
                title: Text("111"),
                children: [
                  SimpleDialogOption(
                    onPressed: () {},
                    child: Text("one"),
                  ),
                  SimpleDialogOption(
                    onPressed: () {},
                    child: Text("one"),
                  )
                ],
              )
            },
            child: Text("SimpleDialog"),
          ),
          MaterialButton(
            onPressed: () => {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: const Text("AlertDialog"),
                        content: const Text(
                            "contentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontentcontent"),
                        actions: [
                          TextButton(
                              onPressed: () => {}, child: const Text("left")),
                          TextButton(
                              onPressed: () => {}, child: const Text("right")),
                        ],
                      ))
            },
            child: const Text("showDialog"),
          ),
          Center(
            child: _gettoggleChild(),
          ),
          ListTile(
            title: Text("title"),
            focusColor: Colors.amber,
            subtitle: Text("title"),
            leading: GestureDetector(
              child: Icon(Icons.not_started),
            ),
            enabled: true,
            onTap: () {
              print("ontap");
            },
          ),
        ],
      ),
    );
  }

  void loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    // http.Response response = await http.get(dataURL);
  }
}

class CustomListItem extends StatelessWidget {
  final Widget thumbnail;
  final String title;
  final String user;
  final int viewcount;

  const CustomListItem(
      {Key? key,
      required this.thumbnail,
      required this.title,
      required this.user,
      required this.viewcount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: thumbnail,
            flex: 2,
          ),
          Expanded(
            child: _VideoDescription(
                title: title, user: user, viewCount: viewcount),
            flex: 3,
          ),
          Column(
            children: [
              GestureDetector(
                  child: const Icon(Icons.more_vert),
                  onTap: () => {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("content")))
                      })
            ],
          )
        ],
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription(
      {Key? key,
      required this.title,
      required this.user,
      required this.viewCount})
      : super(key: key);
  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 30),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1)),
          Text(
            user,
            style: TextStyle(fontSize: 20),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
          Text(
            '$viewCount  views',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
