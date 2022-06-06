import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/screens/meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meals App',
        theme: ThemeData(
          primaryColor: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255,254,229,1),
          fontFamily: 'Raleway',
        ),
        home: CategoryScreens(),
        routes: {
          MealScreen.routeName: (ctx) => const MealScreen(),
          mealDetails.routeName: (ctx) => mealDetails(),
        },
    );
  }
}
