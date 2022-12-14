import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'SamplePage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页20210919"),
        centerTitle: true,
        // actionsIconTheme: IconThemeData(color: Colors.red,opacity: 0.9),//设置导航右边图标的主题色，此时iconTheme对于右边图标颜色会失效
        iconTheme: IconThemeData(color: Colors.black,opacity: 0.6),//设置AppBar上面Icon的主题颜色
        backgroundColor: Colors.amber,//设置背景颜色

        actions: [
          IconButton(icon:Icon(Icons.more_time),onPressed: (){


          },),
          IconButton(icon:Icon(Icons.mobile_screen_share),onPressed: (){
            Share.share("首页20210919");

          },),
        ],
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
                      "adatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadataa",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                    )),
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
                              builder: (context) => Demo2()))
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
