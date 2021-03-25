import 'package:flutter/material.dart';
import 'package:kalkulator/screens/home_kalkulator.dart';
import 'package:kalkulator/screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeKalkulator(),
      routes: <String,WidgetBuilder>{
        'screens/profile': (BuildContext context) => Profile()
      },
    );
  }
}
