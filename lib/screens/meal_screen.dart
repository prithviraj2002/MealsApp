import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data%20(1).dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../model/meal.dart';

class MealScreen extends StatefulWidget {
  const MealScreen(this.availableMeals, {Key? key}) : super(key: key);
  final List<Meal> availableMeals;

  static const routeName = '/meal_screen';

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  var categoryTitle;
  var displayedMeals;

  // @override
  // void initState() {
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.Id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return mealItem(
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
            );
          }),
          itemCount: displayedMeals.length,
        ));
  }
}
