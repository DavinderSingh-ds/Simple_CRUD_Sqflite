import 'package:crud_database/signup.dart';
import 'package:flutter/material.dart';

import 'Database/database.dart';
import 'Model/model.dart';
import 'category_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {Key? key, required this.title, this.categoryModel, this.buttonName})
      : super(key: key);
  final String title;
  final CategoryModel? categoryModel;
  final String? buttonName;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  GlobalKey _formKey = GlobalKey();
  final _databaseProvider = DatabaseProvider.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 500,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _nameController,
                        validator: (s) {
                          if (s!.isEmpty) {
                            return 'Enter the above field First';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'abc@gmail.com',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _colorController,
                        validator: (s) {
                          if (s!.isEmpty) {
                            return 'Enter the above field First';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter the Password',
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.amber,
                      child: Text(
                        widget.buttonName != null ? widget.buttonName! : 'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        final FormState? form =
                            _formKey.currentState as FormState?;
                        if (form!.validate()) {
                          print(
                              'Category Name ${_nameController.text.toString()}');
                          final newCategory = CategoryModel(
                            categoryname: _nameController.text.toString(),
                            dogcolor: _colorController.text.toString(),
                          );
                          if (_nameController.text.toString().isNotEmpty) {
                            var catId =
                                _databaseProvider.addCategory(newCategory);
                            print('${catId.toString()}');
                          }

                          // if (widget.categoryModel != null) {
                          //   newCategory.id = widget.categoryModel!.id;
                          //   _databaseProvider.updateData(newCategory);
                          // }
                        }
                      },
                    ),
                    MaterialButton(
                      color: Colors.blue,
                      child: Text(
                        'Signup',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
