import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
        appBar: AppBar(title: Text('Meal $mealId details')),
        body: Center(child: Text("Recipe Detials - $mealId")));
  }
}
