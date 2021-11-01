import 'package:flutter/material.dart';

class TestView1022 extends StatelessWidget {
  const TestView1022({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[200],
      child: Center(
        child: Container(
          width: 400, height: 400, color: Colors.white, child: NewWidget(),
          // FlutterLogo(size: 400,),
        ),
      ),
    );
  }
}
// Center(
// child: SizedBox.expand(
// child: LayoutBuilder(
// builder: (BuildContext context, BoxConstraints constraints) {
// print("  $constraints");
// return FlutterLogo(
// size: 400,
// );
// }),
// ),
// ),

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 60,
            minWidth: 40,
            maxHeight: double.infinity,
            maxWidth: double.infinity,
          ).loosen(),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              print("$constraints");

              return FlutterLogo(
                size: 20,
              );
            },
          )),
    );
  }
}
