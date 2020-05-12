import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nordev_may_2020_live/components/task_screen/header.dart';
import 'package:flutter_nordev_may_2020_live/components/task_screen/status_chip.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(avatars: this._renderAvatars()),
      body: Column(
        children: [
          this._renderTabs(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return this._renderSubtaskRow(index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return this.getAlertDialog(
                title: Text('test'),
                content: Text('This is some context'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('Ok!'),
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('No!'),
                  ),
                ],
              );
            },
          );

          print(result);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _renderAvatars() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=a72ca28288878f8404a795f39642a46f'),
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=aa3a807e1bbdfd4364d1f449eaa96d82'),
        ),
        CircleAvatar(
          backgroundImage:
              NetworkImage('https://randomuser.me/api/portraits/men/78.jpg'),
        ),
        CircleAvatar(
          backgroundImage:
              NetworkImage('https://randomuser.me/api/portraits/women/44.jpg'),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Icon(Icons.add),
        ),
        Spacer(),
        StatusChip(),
      ],
    );
  }

  Widget _renderTabs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  'Live'.toUpperCase(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Container(
                  height: 4,
                  color: Colors.transparent,
                )
              ],
            ),
          ),
          SizedBox(width: 30),
          Container(
            child: Column(
              children: [
                Text(
                  'Done'.toUpperCase(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Container(
                  width: 44,
                  height: 4,
                  color: Colors.deepPurple,
                )
              ],
            ),
          ),
          SizedBox(width: 30),
          Container(
            child: Column(
              children: [
                Text(
                  'Stand-by'.toUpperCase(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Container(
                  height: 4,
                  color: Colors.transparent,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderSubtaskRow(int index) {
    return Row(
      children: [
        SizedBox(
          width: 40,
          height: 60,
          child: Stack(
            children: [
              Positioned(
                top: index == 0 ? 30 : 0,
                left: 18,
                child: Container(
                  color: Color(0xffC9E8DB),
                  width: 4,
                  height: 60,
                ),
              ),
              Center(
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(0xff4CB489),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.check, size: 12, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title for sub task $index'),
              Text(
                '2 July 2017',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getAlertDialog({Widget title, Widget content, List<Widget> actions}) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actions,
      );
    } else {
      return AlertDialog(
        title: title,
        content: content,
        actions: actions,
      );
    }
  }
}
