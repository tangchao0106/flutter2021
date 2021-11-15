import 'package:flutter/material.dart';

class Slivers extends StatelessWidget {
  const Slivers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("SliverAppBar"),
          ),
          SliverPrototypeExtentList(
              delegate: SliverChildListDelegate([
                Text("HELLO"),
                Text("HELLO"),
                Text("HELLO"),
              ]),
              prototypeItem: FlutterLogo(
                size: 100,
              )),
          SliverToBoxAdapter(
            child: FlutterLogo(
              size: 100,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 20,
                color: Colors.blue,
              );
            }),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 200,
                  color: Colors.primaries[index % 18],
                );
              }),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4)),
          SliverFixedExtentList(
              delegate: SliverChildListDelegate([
                FlutterLogo(),
                FlutterLogo(),
                FlutterLogo(),
              ]),
              itemExtent: 40)
        ],
      ),
    );
  }
}
