import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nordev_may_2020_live/components/tabs/tab_item.dart';

class TabSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TabItem(
          text: 'Live',
        ),
        SizedBox(width: 30),
        TabItem(
          text: 'Done',
          selected: true,
        ),
        SizedBox(width: 30),
        TabItem(
          text: 'Stand-by',
        ),
      ],
    );
  }
}
