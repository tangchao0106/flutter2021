import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("刘德华"),
            accountEmail: Text("15951613060"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/2.png"),
            ),

            // decoration: BoxDecoration(
            //     image:
            //         DecorationImage(image: AssetImage("assets/images/2.png"))),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("设置"),
            trailing: Icon(Icons.phone),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("设置"),
            trailing: Icon(Icons.phone),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("设置"),
            trailing: Icon(Icons.phone),
          ),
          Divider(),
          AboutListTile(
            icon: FlutterLogo(),
            child: Text("关于"),
            applicationName: "第一个flutter",
            applicationIcon: FlutterLogo(),
            applicationVersion: "0.1.0",

            // icon,
            // this.child,
            // this.applicationName,
            // this.applicationVersion,
            // this.applicationIcon,
            // this.applicationLegalese,
            // this.aboutBoxChildren,
          ),
        ],
        //
      ),
    );
  }
}
