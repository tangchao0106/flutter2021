import 'package:flutter/material.dart';

class Demo1031 extends StatelessWidget {
  Demo1031({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "奶茶",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _Body1(),
    );
  }
}

class _Body1 extends StatelessWidget {
  _Body1();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "HELLO,HELLO",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("HELLO,HELLO2",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              width: double.infinity,
              height: 280,
              // color: Colors.amber,

              decoration: BoxDecoration(
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://img-shop.qmimg.cn/s23107/2020/04/26/3eb7808bf105262604.jpg"))),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: 80,
                    width: 260,
                    color: Colors.white,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("外卖"),
                                duration: Duration(seconds: 1),
                                backgroundColor: Colors.blue[100],
                              ));
                            },
                            child: Container(
                              // height: double.infinity,
                              // color: Colors.amberAccent,
                              child: Flex(
                                direction: Axis.vertical,
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Image.asset(
                                    "assets/images/zq.png",
                                    height: 40,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("外卖")
                                ],
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                        SizedBox(
                          width: 0.5,
                          height: double.infinity,
                          child: Container(
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onDoubleTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("double"),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Container(
                              // height: double.infinity,
                              // color: Colors.red[100],
                              child: Flex(
                                direction: Axis.vertical,
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Image.asset(
                                    "assets/images/wm.png",
                                    height: 40,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text("自取")
                                ],
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    )))
          ],
        ),
        Container(
          margin: EdgeInsets.all(8),
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(10)),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flex(
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 8, top: 8),
                    child: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Row(
                          children: [
                            Text("我的积分"),
                            Text(
                              "100",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                        Text("进入积分商城兑换奈雪券及周边好礼进入积分商城兑换奈雪券及周边好礼"),
                      ],
                    ),
                  ),
                ],
              ),
              Flex(
                direction: Axis.vertical,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8, right: 8),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/qrcode.png",
                          height: 40,
                          width: 40,
                        ),
                        Text("会员码")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.amberAccent[200],
        ),
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.amberAccent[100],
        ),
      ],
    ));
  }
}
