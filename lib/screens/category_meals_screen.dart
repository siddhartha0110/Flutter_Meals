import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  //final String cateId;
  //final String catetitle;
  //
  //CategoryMealsScreen(this.cateId, this.catetitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catetitle = routeArgs['title'];
    final cateId = routeArgs['id'];
    final cateMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(cateId);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(catetitle)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: cateMeals[index].id,
                title: cateMeals[index].title,
                imageUrl: cateMeals[index].imageUrl,
                duration: cateMeals[index].duration,
                affordability: cateMeals[index].affordability,
                complexity: cateMeals[index].complexity);
          },
          itemCount: cateMeals.length,
        ));
  }
}
