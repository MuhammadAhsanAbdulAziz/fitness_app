import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String iconPath;
  Color bgColor;

CategoryModel({
  required this.name,
  required this.iconPath,
  required this.bgColor,
});


static List<CategoryModel> getCategoryModel(){
  List<CategoryModel> catList = [];

  catList.add(
    CategoryModel(name: 'Salad', 
  iconPath: 'assets/icons/plate.svg', 
  bgColor: Color(0xff92A3FD))
  );

  catList.add(
    CategoryModel(name: 'Cake', 
  iconPath: 'assets/icons/pancakes.svg', 
  bgColor: Color.fromARGB(255, 146, 253, 180))
  );

  catList.add(
    CategoryModel(name: 'Pancake', 
  iconPath: 'assets/icons/pie.svg', 
  bgColor: Color.fromARGB(255, 212, 146, 253))
  );

  catList.add(
    CategoryModel(name: 'Smoothies', 
  iconPath: 'assets/icons/orange-snacks.svg', 
  bgColor: Color.fromARGB(255, 253, 223, 146))
  );

  return catList;
}

}
