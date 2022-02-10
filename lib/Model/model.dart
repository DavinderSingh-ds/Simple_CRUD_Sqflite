class CategoryModel {
  int? id;
  String categoryname;
  String dogcolor;

  CategoryModel({
    this.id,
    required this.categoryname,
    required this.dogcolor,
  });

  factory CategoryModel.fromDatabaseJson(Map<String, dynamic> data) =>
      CategoryModel(
        id: data['id'],
        categoryname: data['categoryname'],
        dogcolor: data['dogcolor'],
      );

  Map<String, dynamic> toDatabaseJson() => {
        'id': this.id,
        'categoryname': this.categoryname,
        'dogcolor': this.dogcolor,
      };
}
