import 'package:flutter/material.dart';

class mealDetails extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId.toString()),
      ),
      body: Container(
        child: Center(child: Text(mealId.toString())),
      ),
    );
  }
}
