import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/ducafecat1205/common/widget/image.dart';

class Demo1223 extends StatelessWidget {
  const Demo1223({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      body: Container(
        color: Colors.amber,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "1",

                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      splashColor: Colors.red,
                      child: Container(
                          child: Text(
                            "1",

                            overflow: TextOverflow.clip,
                            maxLines: 3,
                          )),
                    ),
                    Spacer(),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 60),
                            child: Text(
                              "1",

                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 100),
                            child: Text(
                              "2021",

                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            child: Icon(
                              Icons.more_horiz,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))

            // SizedBox(
            //   width: 10.w,
            // ),

          ],
        ),
      ),

    );
  }
}
