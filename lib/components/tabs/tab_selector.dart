import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nordev_may_2020_live/components/tabs/tab_item.dart';

class TabSelector extends StatelessWidget {
  final List<String> tabs;
  final int currentTab;
  final Function(int) onTabSelected;

  const TabSelector({
    Key key,
    @required this.tabs,
    @required this.currentTab,
    @required this.onTabSelected,
  }) : super(key: key);

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
            return GestureDetector(
              child: TabItem(
                text: this.tabs[index],
                selected: this.currentTab == index,
              ),
              onTap: () {
                this.onTabSelected(index);
              },
            );
          },
        ),
      ),
    );
  }
}
