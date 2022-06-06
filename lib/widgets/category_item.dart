import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_screen.dart';

class CategoryItem extends StatelessWidget {
  var title;
  var color;
  var id;

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  CategoryItem(this.title, this.color, this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Colors.pink,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(title),
      ),
    );
  }
}
