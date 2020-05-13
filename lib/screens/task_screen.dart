import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nordev_may_2020_live/components/tabs/tab_selector.dart';
import 'package:flutter_nordev_may_2020_live/components/task_screen/header.dart';
import 'package:flutter_nordev_may_2020_live/components/task_screen/status_chip.dart';
import 'package:flutter_nordev_may_2020_live/mixins/alert_dialog_mixin.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> with AlertDialogMixin {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(avatars: this._renderAvatars()),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: TabSelector(
              tabs: [
                'Live',
                'Done',
                'Stand-by',
              ],
              currentTab: this._currentIndex,
              onTabSelected: (newTabIndex) {
                setState(() {
                  this._currentIndex = newTabIndex;
                });
              },
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              /*transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },*/
              child: this._renderActiveList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.close),
        onPressed: () {},
      ),
    );
  }

  Widget _renderActiveList() {
    switch (this._currentIndex) {
      case 0:
        return this._renderLiveList();
      case 1:
        return this._renderDoneList();
      case 2:
        return this._renderStandByList();
      default:
        return Text('I shouldn\'t ever show!');
    }
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

  Widget _renderLiveList() {
    final numberOfElements = 4;
    return ListView.builder(
      key: Key('liveList'),
      padding: EdgeInsets.all(0),
      itemCount: numberOfElements,
      itemBuilder: (context, index) {
        return this._renderSubtaskRow(index, index == numberOfElements - 1);
      },
    );
  }

  Widget _renderDoneList() {
    final numberOfElements = 10;
    return ListView.builder(
      key: Key('doneList'),
      padding: EdgeInsets.all(0),
      itemCount: numberOfElements,
      itemBuilder: (context, index) {
        return this._renderSubtaskRow(index, index == numberOfElements - 1);
      },
    );
  }

  Widget _renderStandByList() {
    final numberOfElements = 2;
    return ListView.builder(
      key: Key('standByList'),
      padding: EdgeInsets.all(0),
      itemCount: numberOfElements,
      itemBuilder: (context, index) {
        return this._renderSubtaskRow(index, index == numberOfElements - 1);
      },
    );
  }

  Widget _renderSubtaskRow(int index, bool isLast) {
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
                  height: isLast ? 30 : 60,
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
}
