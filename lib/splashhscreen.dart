import 'dart:async';

import 'package:flutter/material.dart';

import 'myhomepage.dart';

class SplashhScreen extends StatefulWidget {
  const SplashhScreen({Key? key}) : super(key: key);

  @override
  _SplashhScreenState createState() => _SplashhScreenState();
}

class _SplashhScreenState extends State<SplashhScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(
            title: 'Sqflite CRUD operations',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Image.network(
                'https://image.flaticon.com/icons/png/512/187/187902.png'),
          ),
          // CircularProgressIndicator(),
          // Text(
          //   'Loading.......',
          //   style: TextStyle(
          //     color: Theme.of(context).accentColor,
          //     fontFamily: 'Times New Roman',
          //     fontSize: 20.0,
          //   ),
          // ),
        ],
      ),
    );
  }
}
