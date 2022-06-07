import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool GlutenFree = false;
  bool isVegan = false;
  bool vegetarian = false;
  bool lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Settings!'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selections',
              style: TextStyle(fontSize: 22),
            ),
          ),
          Container(
            height: 600,
            width: double.infinity,
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten Free'),
                  value: GlutenFree,
                  onChanged: (bool newValue) {
                    setState(() {
                      GlutenFree = newValue;
                    });
                  },
                  subtitle: Text('Display only Gluten Free meals'),
                ),
                SwitchListTile(
                  title: Text('Vegan Meals'),
                  value: isVegan,
                  onChanged: (bool newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                  },
                  subtitle: Text('Display only Vegan meals'),
                ),
                SwitchListTile(
                  title: Text('Vegetarian Meals'),
                  value: vegetarian,
                  onChanged: (bool newValue) {
                    setState(() {
                      vegetarian = newValue;
                    });
                  },
                  subtitle: Text('Display only vegetarian meals'),
                ),
                SwitchListTile(
                  title: Text('Lactose Free'),
                  value: lactoseFree,
                  onChanged: (bool newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  },
                  subtitle: Text('Display only Lactose Free meals'),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
