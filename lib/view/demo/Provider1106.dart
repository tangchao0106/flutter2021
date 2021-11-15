import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider extends StatelessWidget {
  final String? id;

  Provider({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //创建provider-注册数据模型
    return ChangeNotifierProvider(
      create: (BuildContext context) => LikeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("第一个Provier实例 $id"),
        ),
        body: MyFirstProvider(),
      ),
    );
  }
}

class MyFirstProvider extends StatelessWidget {
  const MyFirstProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // InteractiveViewer(
          //   maxScale: 5,
          //   minScale: 0.2,
          //   child: SizedBox(
          //       width: 10,
          //       height: 10,
          //       child: Image.asset("assets/images/2.png")),
          //   constrained: false,
          // ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              color: Colors.red[200],
              alignment: Alignment.center,
              //文字填满整行
              child: FittedBox(
                child: Text(
                  "${context.watch<LikeViewModel>().counter}" * 10,
                  style: TextStyle(fontSize: 28),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () =>
                    context.read<LikeViewModel>().incrementCounter(),
                child: Text("+1")),
          ),
          MaterialButton(
            onPressed: () {
              context.read<LikeViewModel>().jianCounter();
            },
            child: Text("-1"),
            color: Colors.yellow,
          ),

          PhysicalModel(
            color: Colors.yellow,
            // shape: BoxShape.circle,
            elevation: 2.0,
            borderRadius: BorderRadius.circular(20),
            child: FlutterLogo(
              size: 100,
            ),
          ),
          SafeArea(child: Text("刘海屏" * 10)),
          AnimatedDefaultTextStyle(
              child: Text("${context.watch<LikeViewModel>().counter}"),
              style: TextStyle(fontSize: 20, color: Colors.red),
              duration: Duration(seconds: 2)),
          // DefaultTextStyle.merge(style: style, child: child)
        ],
      ),
    );
  }
}

//1创建数据模型
class LikeViewModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  incrementCounter() {
    _counter++;

    notifyListeners();
  }

  jianCounter() {
    _counter--;
    notifyListeners();
  }
}
