import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_listview_demo/page/ListViewFirstVisibleItem.dart';
import 'package:flutter_app_listview_demo/page/remove_bound_color.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber, borderRadius: BorderRadius.circular(50)),
                child: Text("获取listView 第一个可见item"),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return ListViewFirstVisibleItem();
                }));
              },
            ),
            GestureDetector(
              child: Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(50)),
                child: Text("去除边界效果"),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return RemoveBoundColor();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
