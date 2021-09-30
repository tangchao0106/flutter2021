import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SamplePage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        // leading: new BackButton(),
        leading: new CloseButton(),
      ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeBodyState();
  }
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    // HttpRequest.
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Card(
          child: Container(
            // margin: EdgeInsets.fromLTRB(8,60,8,60),
            padding: EdgeInsets.all(10),
            // padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            width: double.infinity,

            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.end,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    child: Text(
                      "datadatadatadatdatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadataa",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                    )),
                Text("datadatadatadata"),
                Text("datadatadatadata"),
                Text("datadatadatadata"),
                Text("datadatadatadata"),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/2.png",
                  fit: BoxFit.fill,
                ),
                ratings,
                // // testcontainer,
                // ElevatedButton(onPressed: value=>{
                //
                // }),
                ElevatedButton(
                    onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SamplePage()))
                        },
                    child: Text("go")),

              ],
            ),
          ),
        ),
      ),
    );
  }

  final testcontainer = Container(
    // constraints: new BoxConstraints.expand(
    //   height: Theme.of(context).textTheme.display1.f
    // ),
    decoration: new BoxDecoration(
      border: new Border.all(width: 2.0, color: Colors.red),
      color: Colors.grey,
      borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
      image: new DecorationImage(
        image: new NetworkImage(
            'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
      ),
    ),
    padding: const EdgeInsets.all(8.0),
    child: new Text(
      'Hello World',
    ),
  );

  final ratings = Container(
    // padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Icon(
              Icons.home,
              color: Colors.black,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
            ),
          ],
        ),
        Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      ],
    ),
  );
}
