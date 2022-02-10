import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 300,
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.ac_unit),
                  fillColor: Colors.blue,
                  labelText: 'Enter Name',
                  hintText: 'john',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.ac_unit),
                  fillColor: Colors.blue,
                  labelText: 'Enter Name',
                  hintText: 'john',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.ac_unit),
                  fillColor: Colors.blue,
                  labelText: 'Enter Name',
                  hintText: 'john',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.ac_unit),
                  fillColor: Colors.blue,
                  labelText: 'Enter Name',
                  hintText: 'john',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.ac_unit),
                  fillColor: Colors.blue,
                  labelText: 'Enter Name',
                  hintText: 'john',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.ac_unit),
                  fillColor: Colors.blue,
                  labelText: 'Enter Name',
                  hintText: 'john',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.ac_unit),
                  fillColor: Colors.blue,
                  labelText: 'Enter Name',
                  hintText: 'john',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
