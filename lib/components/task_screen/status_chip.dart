import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Ongoing',
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
