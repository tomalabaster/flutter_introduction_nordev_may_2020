import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nordev_may_2020_live/components/tabs/tab_item.dart';

class TabSelector extends StatefulWidget {
  final List<String> tabs;
  final int initialTab;
  final Function(int) onTabSelected;

  const TabSelector({Key key, this.tabs, this.initialTab, this.onTabSelected})
      : super(key: key);

  @override
  _TabSelectorState createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return TabItem(
              text: this.widget.tabs[index],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 30);
          },
          itemCount: this.widget.tabs.length),
    );
  }
}
