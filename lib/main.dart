import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filterScreen.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meals App',
        home: TabScreen(),
        routes: {
          MealScreen.routeName: (ctx) => const MealScreen(),
          mealDetails.routeName: (ctx) => mealDetails(),
          FilterScreen.routeName: (ctx) => const FilterScreen()
        },
    );
  }
}
