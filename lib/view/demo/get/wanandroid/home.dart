import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/theme/app_style.dart';
import 'package:untitled/view/demo/get/wanandroid/square.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  Widget _buildTopBarUI(BuildContext context) {
    return PreferredSize(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [_buildTabItemUI()],
          ),
        ),
        preferredSize: Size(double.infinity, 100.h));
  }




  Widget _buildTabItemUI() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TabBar(
        tabs: [
          Tab(
            child: Text("广场"),
          ),
          Tab(
            child: Text("广场"),
          ),
          Tab(
            child: Text("广场"),
          )
        ],
        isScrollable: true,
        controller: _tabController,
        indicator: BoxDecoration(),
        labelStyle: TextStyle(fontSize: 20, height: 2),
        unselectedLabelStyle: TextStyle(fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            child: Scaffold(
              backgroundColor: Colors.white,
              // appBar: _buildTopBarUI(context),
              body: TabBarView(
                children: [SquarePage(), SquarePage(), SquarePage()],
                controller: _tabController,
              ),
            ),
            value: lightSystemUiStyle));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
