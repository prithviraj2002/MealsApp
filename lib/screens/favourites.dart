import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(child: Text('You have no favourites, start adding some!'));
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return mealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        }),
        itemCount: favouriteMeals.length,
      );
    }
  }
}
