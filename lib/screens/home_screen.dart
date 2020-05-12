import 'package:flutter/material.dart';
import 'package:flutter_nordev_may_2020_live/components/task_row.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  final Box myBox = Hive.box('myBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: this.myBox.listenable(),
        builder: (context, box, widget) {
          return ListView.builder(
            itemCount: this.myBox.get('count', defaultValue: 0) as int,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: TaskRow(),
                onTap: () {
                  Navigator.of(context).pushNamed('/task');
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var count = this.myBox.get('count', defaultValue: 0) as int;

          count = count + 1;

          this.myBox.put('count', count);
        },
      ),
    );
  }
}
