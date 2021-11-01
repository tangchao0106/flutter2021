import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo1025 extends StatelessWidget {
  Demo1025({Key? key}) : super(key: key);
  List<String> _list = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

  List<Widget> _group() {
    return _list
        .map((item) => Chip(
              label: Text(item),
              avatar: CircleAvatar(
                backgroundColor: Colors.amberAccent,
                child: Text("字母"),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
              child: FlutterLogo(
                size: 100,
              ),
              flex: 2,
            ),
            //先给没有弹性的布局大小，剩余的再给弹性的
            Expanded(
                child: ListView(
              children: [for (int i = 0; i < 100; i++) Text("$i")],
            )),
            ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 100.0,
                  minHeight: 100.0,
                  maxWidth: 150.0,
                  maxHeight: 150.0,
                ).loosen(),
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  print("object  $constraints");

                  return Container(
                    width: 30,
                    height: 100,
                    color: Colors.red,
                  );
                })),
            LimitedBox(
              maxWidth: 100,
              child: Container(
                color: Colors.black,
                width: 200,
              ),
            ),
            CupertinoButton(
                child: Text("CupertinoButton"),
                color: Colors.amber,
                onPressed: () {}),
            SizedBox(
              height: 30,
            ),
            Wrap(
              children: _group(),
              spacing: 10.0,
              runSpacing: 8,
            ),
            SizedBox(
              height: 30,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.loose(Size(80, 100)),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    color: Colors.red,

                  ),
                  Icon(Icons.add),
                  Text("Text"),
                  Positioned(
                    child: Icon(Icons.more),
                    bottom: 10,
                  )
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        showAboutDialog(
                            context: context,
                            applicationName: "applicationName",
                            applicationIcon: Icon(
                              Icons.home,
                            ),
                            applicationVersion: "1.1");
                      },
                      icon: Icon(Icons.share)),
                  Chip(
                    label: Text("chip"),
                    avatar: CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Text("C"),
                    ),
                  ),
                  Icon(
                    Icons.security_rounded,
                    size: 50,
                  ),
                  Icon(
                    Icons.security_rounded,
                    size: 50,
                  ),
                  Icon(
                    Icons.security_rounded,
                    size: 50,
                  ),
                  Icon(
                    Icons.security_rounded,
                    size: 50,
                  ),
                ])
            // Stack(
            //   fit: StackFit.loose, //默认松约束，可以在他的最大范围内
            //   // fit: StackFit.expand,
            //   alignment: Alignment.topCenter,
            //   children: [
            //     // FlutterLogo(),
            //     // Text(
            //     //   "text",
            //     //   style: Theme.of(context).textTheme.bodyText1,
            //     // ),
            //     // Positioned(
            //     //   child: Container(
            //     //     width: 30,
            //     //     height: 30,
            //     //     color: Colors.red[100],
            //     //   ),
            //     //   top: 0,
            //     //   right: 0,
            //     // )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
