import 'package:flutter/material.dart';

import 'Database/database.dart';
import 'Model/model.dart';
import 'myhomepage.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  var _databaseProvider;

  late Future<List<CategoryModel>> categoryList;

  @override
  void initState() {
    super.initState();
    _databaseProvider = DatabaseProvider.instance;
    refreshData();
  }

  refreshData() {
    setState(() {
      getCategories();
    });
  }

  getCategories() {
    setState(() {
      categoryList = _databaseProvider.retriveCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category List'),
      ),
      body: FutureBuilder(
        future: this.categoryList,
        builder: (BuildContext context,
            AsyncSnapshot<List<CategoryModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount:
                  snapshot.data?.length, //snaphot.data?.length = 4 = index
              itemBuilder: (BuildContext context, int index) {
                CategoryModel categoryModel = snapshot.data![index];
                return Card(
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 260,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              snapshot.data![index].id.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Text(
                              snapshot.data![index].categoryname.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              snapshot.data![index].dogcolor.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(
                                      title: 'Update Category',
                                      categoryModel: categoryModel,
                                      buttonName: 'Update',
                                    ),
                                  ),
                                );
                                refreshData();
                              },
                              child: Icon(
                                Icons.update,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                _databaseProvider
                                    .deleteCategory(categoryModel.id);
                                refreshData();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Category Deleted'),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
