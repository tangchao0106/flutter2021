import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String dec;
  final String imageurl;

  ProductItem(this.title, this.dec, this.imageurl);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 20),),
        SizedBox(height: 10,),
        Text(title, style: TextStyle(fontSize: 10),),
        SizedBox(height: 10,),
        Image.network(imageurl)

      ],
    );
  }
}
