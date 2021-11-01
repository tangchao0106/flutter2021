import 'package:flutter/material.dart';

class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("我的"),
        ),
        body: Body2());
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(10),
      reverse: true,
      physics: BouncingScrollPhysics(),
      child: Container(
          height: 200,
          child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.add),
                title: Text("title"),
                subtitle: Text("subtitle"),
                trailing: Icon(Icons.arrow_right),
                selected: true,
                selectedTileColor: Colors.yellow[100],
              ),
              Divider(
                thickness: 4,
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("title"),
                subtitle: Text("subtitle"),
                trailing: Icon(Icons.arrow_right),
              ),
              Divider(
                thickness: 4,
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("title"),
                subtitle: Text("subtitle"),
                trailing: Icon(Icons.arrow_right),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("title"),
                subtitle: Text("subtitle"),
                trailing: Icon(Icons.arrow_right),
              ),
            ],
          )),
    );
  }
}

class Body2 extends StatelessWidget {
  const Body2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Text("AA$index");
        },
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.amber,
          );
        },
      ),
    );
  }
}
