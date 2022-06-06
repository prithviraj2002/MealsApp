import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import '../data/dummy_data (1).dart';


class CategoryScreens extends StatelessWidget{
  const CategoryScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals App'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.title, catData.color, catData.id)).toList()
        ),
    );
  }
}