import 'package:flutter/material.dart';

class Demo1029 extends StatelessWidget {
  const Demo1029({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      // constraints: BoxConstraints.loose(Size(100, 50)),
      constraints: BoxConstraints.expand(),
      child: Column(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm)),
          TextButton(onPressed: () {}, child: Icon(Icons.access_alarm)),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.access_alarm),
            label: Text("TextButton"),
          ),
          ElevatedButton(onPressed: () {}, child: Text("ElevatedButton")),
          OutlinedButton(onPressed: () {}, child: Text("OutlinedButton")),
          OutlinedButtonTheme(
              data: OutlinedButtonThemeData(
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.red))),
              child: OutlinedButton(
                  onPressed: () {}, child: Text("OutlinedButtonTheme"))),
          Container(
              color: Colors.yellow,
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                print("constraintsconstraints=$constraints");
                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                            10,
                                (index) => OutlinedButton(
                                onPressed: () {}, child: Text("$index"))),
                      ),
                    ),

                    Container(
                      color: Colors.red[50],
                    ),
                    Text("Text"),
                    // 垂直方向上没有定位，那么它在垂直方向的对齐方式则会按照alignment指定的对齐方式对齐
                    Positioned(
                      child: Text('Positioned'),
                      top: 50,
                    ),
                    Positioned(
                      child: Text('text11'),
                      left: 50,
                    ),

                    // Card(
                    //   margin: EdgeInsets.all(10),
                    //   shadowColor: Colors.yellow,
                    //   elevation: 20,
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //       side: BorderSide(color: Colors.red, width: 3)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text("CARD"),
                    //   ),
                    // )
                  ],
                );
              })),
        ],
      ),
    );
  }
}
