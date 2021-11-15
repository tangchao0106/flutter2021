import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformChannel extends StatefulWidget {
  const PlatformChannel({Key? key}) : super(key: key);

  @override
  _PlatformChannelState createState() => _PlatformChannelState();
}

class _PlatformChannelState extends State<PlatformChannel> {
  static const MethodChannel methodChannel =
  MethodChannel('samples.flutter.io/battery');

  static const EventChannel eventChannel =
  EventChannel('samples.flutter.io/charging');

  String _batteryLevel = '000000';
  String _chargingStatus = 'eventChannel返回值';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int? result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'flutter调用原生方法 $result%.';
    } on PlatformException {
      batteryLevel = 'flutter调用原生方法F失败.';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
  Future<void> _twoactivity() async{
   String res= await methodChannel.invokeMethod("TwoActivity");
   setState(() {
     _batteryLevel = res;
   });
  }

  Future<Null> _jumpToNativeWithParams() async {

    Map<String, String> map = { "flutter": "这是一条来自flutter的参数" };
    String result = await methodChannel.invokeMethod('withParams', map);
    setState(() {
      _batteryLevel = result;
    });
    print(result);
  }



  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object? event) {
    setState(() {
      _chargingStatus =
      "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
    });
  }

  void _onError(Object error) {
    setState(() {
      _chargingStatus = 'Battery status: unknown.';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_batteryLevel, style: TextStyle(fontSize: 50),),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _getBatteryLevel,
                  child: const Text('Flutter调用原生方法methodChannel'),
                ),
              ),
              ElevatedButton(onPressed:_twoactivity, child: Text("Flutter跳转到原生第二个页面methodChannel")),
              ElevatedButton(onPressed:_jumpToNativeWithParams, child: Text("Flutter带参数跳转到原生methodChannel")),
              // ElevatedButton(onPressed:_jumpToNativeWithParams, child: Text("Flutter带参数跳转到原生 eventChannel")),
            ],
          ),
          Text(_chargingStatus),
        ],
      ),
    );
  }
}
