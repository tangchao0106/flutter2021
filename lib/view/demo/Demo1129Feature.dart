import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

//enent loop 事件循环 main-microtask-event queue
class Feature11129 extends StatefulWidget {
  Feature11129({Key? key}) : super(key: key);

  @override
  State<Feature11129> createState() => _Feature11129State();
}

class _Feature11129State extends State<Feature11129> {
  void getFeature() {
    //同步执行
    Future.value("1");
    Future.sync(() => print("11"));
    Future.delayed(Duration(seconds: 1)).then((value) => print("2"));
    Future.delayed(Duration(seconds: 1), () => {print("33")});

    scheduleMicrotask(() => {print("scheduleMicrotask立即执行")});
    Future.microtask(() => print("Future.microtask"));
  }

  Future<String> t1() {
    return Future.value("2");
  }

  void get() {
    t1().then((value) {}).catchError((onError) => {}).whenComplete(() => {});
  }

  void get2() async {
    var a = await t1();
  }

  //返回future
  Future<int> getId() async {
    return 6;
  }

//返回Stream
  Stream<DateTime> getTime() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield DateTime.now();
    }
  }

// length<2向左补'0'
  String getTimeFormat() {
    var date = DateTime.now();
    String timestamp =
        "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}";
    return timestamp;
  }

  late final Stream stream;

  // final stream = Stream.periodic(Duration(seconds: 1), (_) => "Stream流持续返回数据 periodic=定期");
  Logger logger = Logger();

  //创建数据流--需要开关注入数据
  // final controller = StreamController();
  final controller =
      StreamController.broadcast(); //使用broadcast 没有监听时候数据不会被缓存。当有监听了才发送
  @override
  void dispose() {
    // TODO: implement dispose
    controller.close(); //流需要被结束
    super.dispose();
  }

  @override
  void initState() {
    // controller.sink.addError("注入addError数据");
    stream = Stream.periodic(Duration(seconds: 1), (_) => getTimeFormat());

    Future.delayed(Duration(seconds: 5), () {
      controller.stream.listen((event) {
        logger.d("对流进行监听=$event   默认情况下一个数据流只能有一个监听=使用broadcast变成广播，就可以很多人监听，");
      });
    });

    getId().then((value) => logger.d("对Feture进行监听=$value"));
    // stream.listen((event) {
    //   logger.d("对流进行监听=$event");
    // }, onError: (error) {
    //   logger.d("对流进行监听error=$error");
    // }, onDone: () {
    //   logger.d("对流进行监听 onDone=");
    // });
    super.initState();
  }

  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future与Stream"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            Text("Future=未来期货。以后打开，"),
            Text("scheduleMicrotask，  Future.microtask 事件循环优先执行"),
            Text("Future.value， Future.sync Future.delayed "),
            Text("padLeft==length<2向左补'0'"),
            FutureBuilder(
                future: Future.delayed(
                    Duration(seconds: 2), () => "使用FutureBuilder==对Future进行监听"),
                initialData: 1100,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  //snapshot快照
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text(" FutureBuilder==${snapshot.data}");
                  }
                  return Text("FutureBuilder===");
                }),
            Text("使用streamBuild进行监听"),
            StreamBuilder(
                stream: stream, //stream变化时，会重新build
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  //snapshot获取stream最新状态
                  //active=活跃的数据流，随时会产生一个新的数据流或错误。
                  // snapshot.connectionStat
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text("ConnectionState.none");
                      break;
                    case ConnectionState.waiting:
                      return Text("ConnectionState.waiting");
                      break;
                    case ConnectionState.active:
                      if (snapshot.hasError) {
                        return Text("ConnectionState.错误==${snapshot.error}");
                      } else {
                        return Text("ConnectionState=正常==${snapshot.data}");
                      }
                      break;
                    case ConnectionState.done:
                      return Text("ConnectionState.数据流关闭");
                      break;
                  }
                }),
            ElevatedButton(
                onPressed: () {
                  controller.sink.add("注入数据");
                },
                child: Text("注入数据流，使用广播模式,可以被多人监听，数据不会被缓存。")),
            Text("手动创建数据流controller"),
            StreamBuilder(
                // stream: controller.stream, //stream变化时，会重新build
                stream: controller.stream
                    .where((event) => event is String) //过滤
                    .map((event) => event * 2)
                    .distinct(), //去重时，数据一样时候就不会重新build
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  logger.d("build");
                  //snapshot获取stream最新状态
                  //active=活跃的数据流，随时会产生一个新的数据流或错误。
                  // snapshot.connectionStat
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text("ConnectionState.none");
                      break;
                    case ConnectionState.waiting:
                      return Text("ConnectionState.waiting");
                      break;
                    case ConnectionState.active:
                      if (snapshot.hasError) {
                        return Text("ConnectionState.错误==${snapshot.error}");
                      } else {
                        return Text("ConnectionState=正常==${snapshot.data}");
                      }
                      break;
                    case ConnectionState.done:
                      return Text("ConnectionState.数据流关闭");
                      break;
                  }
                }),
            Text("streamTransformer使用，用上一个流产生一个新的流"),
            StreamBuilder(
                stream: controller.stream.transform(TallyTransformer()),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    score += snapshot.hasData as int;
                  }
                  return Text("score==$score");
                })
          ],
        ),
      ),
    );
  }
}

class  TallyTransformer implements StreamTransformer {
  int sum = 0;
  StreamController _controller = StreamController();

  @override
  Stream bind(Stream stream) {//把初始的数据流转换为其他流
    stream.listen((event) {
      sum += event as int;
      _controller.add(sum);
    });
    return _controller.stream;
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() {
    //因为把一个数据流转换为另一个数据流，对他的类型检测造成困扰。帮助做运行时候的检查
   return StreamTransformer.castFrom(this);//自动实现转换

  }
}
