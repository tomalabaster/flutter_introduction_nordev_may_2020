import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nordev_may_2020_live/components/tabs/tab_item.dart';

class TabSelector extends StatelessWidget {
  final List<String> tabs;

  const TabSelector({Key key, this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(
          this.tabs.length,
          (index) {
            return TabItem(
              text: this.tabs[index],
              selected: false,
            );
          },
        ),
      ),
    );
  }
}
