import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data%20(1).dart';
import 'package:meals_app/screens/filterScreen.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'model/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'Gluten': false,
    'vegan': false,
    'lactose': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['Gluten'] != null &&
            filters['Gluten'] == true &&
            !meal.isGlutenFree) {
          return false;
        }
        if (filters['vegan'] != null &&
            filters['vegan'] == true &&
            !meal.isVegan) {
          return false;
        }
        if (filters['lactose'] != null &&
            filters['lactose'] == true &&
            !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegetarian'] != null &&
            filters['vegetarian'] == true &&
            !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    final existingIndex =
        favouriteMeals.indexWhere((meal) => mealId == meal.id);

    if (existingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavourite(String id) {
    return favouriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      home: TabScreen(favouriteMeals),
      routes: {
        MealScreen.routeName: (ctx) => MealScreen(availableMeals),
        mealDetails.routeName: (ctx) => mealDetails(toggleFavourite, isFavourite),
        FilterScreen.routeName: (ctx) => FilterScreen(filters, setFilters)
      },
    );
  }
}
