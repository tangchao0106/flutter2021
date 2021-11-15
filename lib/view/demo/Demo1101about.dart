import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _list = List.generate(20, (index) => "$index");

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                  value: "1",
                  child: ListTile(
                    leading: Icon(Icons.share),
                    title: Text("分享"),
                  )),
              PopupMenuDivider(),
              PopupMenuItem(
                  value: "2",
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("设置"),
                  )),
            ],
            tooltip: "点击",
            onSelected: (String result) {
              switch (result) {
                case "1":
                  showAboutDialog(context: context);
                  break;
                case "2":
                  showAboutDialog(context: context);
                  break;
              }
            },
            onCanceled: () {},
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   title: Text("关于项目"),
          //   expandedHeight: 230,
          //   floating: false,
          //   pinned: true,
          //   snap: false,
          //
          //   flexibleSpace: FlexibleSpaceBar(
          //     background: Image.network(
          //         "https://img-shop.qmimg.cn/s23107/2020/04/26/3eb7808bf105262604.jpg"),
          //   ),
          // ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "data",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              "data",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              "data",
                              style: TextStyle(fontSize: 25),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Text("github"),
                                  GestureDetector(
                                    child: Text(
                                      "wanandroid-flutter",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.blue),
                                    ),
                                    onTap: () {},
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "开源库",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            ListView.builder(
                              itemCount: _list.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(_list[index].toString()),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                  childCount: 1),
              itemExtent: 600)
        ],
      ),
    );
  }
}
