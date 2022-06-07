import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Cooking Up!',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
          ),
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 26,
          ),
          title: Text(
            'Meals',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
          ),
          title: Text(
            'Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/filter-screen');
          },
        ),
      ]),
    );
  }
}
