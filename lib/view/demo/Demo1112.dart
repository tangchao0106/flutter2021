import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:untitled/view/demo/viewModel1114.dart';

class Demo1112 extends StatelessWidget {
  const Demo1112({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Demo1114(),
      child: Scaffold(
        body: Column(
          children: [
            // Image.asset("name"),
            // Image(
            //   image: AssetImage("assetName"),
            // ),
            Placeholder(
              fallbackWidth: 100,
              fallbackHeight: 100,
            ),
            CachedNetworkImage(
              imageUrl:
                  "https://img-shop.qmimg.cn/s23107/2020/04/26/3eb7808bf105262604.jpg",
              placeholder: (context, url) => CircularProgressIndicator(
                color: Colors.red,
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // FadeInImage.assetNetwork(
            //     placeholder:
            //         "https://img-shop.qmimg.cn/s23107/2020/04/26/3eb7808bf105262604.jpg",
            //     image:
            //         "https://img-shop.qmimg.cn/s23107/2020/04/26/3eb7808bf105262604.jpg"),
            ElevatedButton(
                onPressed: () {
                  context.watch<Demo1114>().login();
                },
                child: Text("+1"))
          ],
        ),
      ),
    );
  }
}
