import 'package:flutter/material.dart';
import 'package:parsingdemo/pages/details_page.dart';
import 'package:parsingdemo/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes:  {
        HomePage.id: (context)=>  const HomePage(),
        DetailsPage.id:(context)=>  const DetailsPage(),
      },
    );
  }
}
