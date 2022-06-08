import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data (1).dart';

class mealDetails extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  const mealDetails(this.toggleFavourite, this.isFavourite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Ingredients",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffd3d3d3),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: ((context, index) => Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    )),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Steps",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Color(0xffd3d3d3),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 200,
                width: 300,
                child: ListView.builder(
                  itemBuilder: ((context, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text(" # ${index + 1}"),
                            ),
                            title: Text(selectedMeal.steps[index]),
                          ),
                          Divider(),
                        ],
                      )),
                  itemCount: selectedMeal.steps.length,
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            isFavourite(mealId)? Icons.star : Icons.star_border
          ),
          onPressed: () => toggleFavourite(mealId),
          ),
    );
  }
}
