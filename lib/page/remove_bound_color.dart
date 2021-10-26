// 移除 顶部的边界效果

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoveBoundColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = <int>[];
    for (var i = 0; i < 100; i++) {
      data.add(i);
    }

    // OverScrollBehavior 官方Behavior
    return Scaffold(
        body: ScrollConfiguration(
      behavior: OverScrollBehavior(),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            key: ValueKey(index),
            height: 50,
            alignment: Alignment.center,
            child: Text(
              "$index",
              style: TextStyle(fontSize: 14),
            ),
          );
        },
      ),
    ));
  }
}

class OverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          child: child,
          //不显示头部水波纹
          showLeading: false,
          //不显示尾部水波纹
          showTrailing: false,
          axisDirection: axisDirection,
          color: Theme.of(context).accentColor,
        );
    }
    return child;
  }
}
