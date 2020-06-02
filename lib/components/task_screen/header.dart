import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  final Widget avatars;

  const Header({Key key, @required this.avatars, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            this.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            this.subtitle,
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
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 200);
}
