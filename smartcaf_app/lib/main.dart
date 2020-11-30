import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_pet_app/login.dart';
import 'package:my_pet_app/src/ui/HomePage.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMARTCAF APP',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.compact,
      ),
      home: LoginPage(),
    );
  }
}
