import 'package:flutter/material.dart';

class Header extends AppBar {
  Header(Widget avatars)
      : super(
          bottom: PreferredSize(
            preferredSize: Size(double.maxFinite, 100),
            child: Container(),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff646AD0),
                  Color(0xff9E6DBC),
                ],
              ),
            ),
            padding: EdgeInsets.fromLTRB(4, 40, 4, 4),
            child: Column(
              children: [
                Text(
                  'Whizzy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Redesign App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Spacer(),
                avatars,
              ],
            ),
          ),
        );
}
