import 'package:flutter/material.dart';

class Demo4Page extends StatefulWidget {
  const Demo4Page({Key? key}) : super(key: key);

  @override
  _Demo4PageState createState() => _Demo4PageState();
}

class _Demo4PageState extends State<Demo4Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "发布成功",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
        ),
        leading: CloseButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      body: Page4(),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      padding: EdgeInsets.only(top: 42),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                margin: EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/2.png"),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 52,
                child: Stack(
                  children: [
                    Image.asset("assets/images/2.png"),
                    Positioned(
                        left: 10,
                        top: 10,
                        child: Text(
                          "StackS1",
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                ),
              ),
              Container(
                child: Container(
                  // padding: EdgeInsets.fromLTRB(24, 28, 24, 28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("data"),
                      Wrap(
                        children: [
                          WorkTotalItem(title: "课文"),
                          WorkTotalItem(title: "课文"),
                          WorkTotalItem(title: "课文"),
                          WorkTotalItem(title: "课文"),
                          WorkTotalItem(title: "课文"),
                          WorkTotalItem(title: "课文"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class WorkTotalItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("$title"),
    );
  }

  WorkTotalItem({required this.title});

  final String title;
}

class RoundInnerSquareBox extends StatelessWidget {
  final Widget chlid;

  RoundInnerSquareBox({Key? key, required this.chlid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        child: Text("345678"),
      ),
    );
  }
}
