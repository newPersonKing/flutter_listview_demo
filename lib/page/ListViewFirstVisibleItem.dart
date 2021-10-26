import 'package:flutter/material.dart';

class ListViewFirstVisibleItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListViewFirstVisibleItemState();
}

// 找到第一个可见item的index
class _ListViewFirstVisibleItemState extends State<ListViewFirstVisibleItem> {
  @override
  Widget build(BuildContext context) {
    var data = <int>[];
    for (var i = 0; i < 100; i++) {
      data.add(i);
    }
    return Scaffold(
      body: ListView.custom(
          cacheExtent: 0, // 这个是指为0  不然最后一个不正确
          childrenDelegate: CustomDelete(
                  (context, index) {
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
              childCount: data.length)),
    );
  }
}

class CustomDelete extends SliverChildBuilderDelegate {
  const CustomDelete(
    NullableIndexedWidgetBuilder builder, {
    ChildIndexGetter? findChildIndexCallback,
    int? childCount,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    int semanticIndexOffset = 0,
  }) : super(builder,
            findChildIndexCallback: findChildIndexCallback,
            childCount: childCount,
            addAutomaticKeepAlives: addAutomaticKeepAlives,
            addRepaintBoundaries: addRepaintBoundaries,
            addSemanticIndexes: addSemanticIndexes,
            semanticIndexOffset: semanticIndexOffset);

  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    // TODO: implement didFinishLayout
    super.didFinishLayout(firstIndex, lastIndex);

    print("log====firstIndex:$firstIndex;lastIndex;$lastIndex");
  }
}
