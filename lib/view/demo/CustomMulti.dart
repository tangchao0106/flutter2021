import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class CustomMulti extends StatelessWidget {
  const CustomMulti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomMultiChildLayout(
        delegate: MyDelegate(),
        children: [
          LayoutId(
              id: 1,
              child: Container(
                color: Colors.red[200],
              )),
          LayoutId(
              id: 2,
              child: Container(
                color: Colors.yellow,
              )),
        ],
      ),
    );
  }
}

class glass extends StatelessWidget {
  const glass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://img-shop.qmimg.cn/s23107/2020/04/26/3eb7808bf105262604.jpg"),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(200.0),
                child: Text(
                  "Night sky",
                  style: TextStyle(color: Colors.yellow),
                ),
              ),
            ).asGlass(
              tintColor: Colors.transparent,
              clipBorderRadius: BorderRadius.circular(15.0),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    var size1, size2;
    if (hasChild(1)) {
      size1 = layoutChild(1, BoxConstraints.tight(Size(100, 100)));
      positionChild(1, Offset(0, 0));
    }
    if (hasChild(2)) {
      size2 = layoutChild(
          2,
          BoxConstraints(
              maxHeight: 100, minHeight: 10, maxWidth: 100, minWidth: 10));
      positionChild(2, Offset(size1.width, size1.height + 100));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
