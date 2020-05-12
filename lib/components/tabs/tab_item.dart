import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabItem extends StatelessWidget {
  final String text;
  final bool selected;

  const TabItem({
    Key key,
    this.text,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: this.selected ? Colors.deepPurple : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      padding: EdgeInsets.only(bottom: 4),
      child: Text(
        this.text.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
