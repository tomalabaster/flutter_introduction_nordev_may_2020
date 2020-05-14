import 'package:flutter/material.dart';
import 'package:flutter_nordev_may_2020_live/screens/home_screen.dart';
import 'package:flutter_nordev_may_2020_live/screens/task_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/task': (context) => TaskScreen(
              todo: ModalRoute.of(context).settings.arguments,
            ),
      },
    );
  }
}
