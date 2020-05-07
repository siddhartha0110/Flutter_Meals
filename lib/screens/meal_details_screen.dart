import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetails extends StatelessWidget {
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildSectionContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 300,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final displayMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(title: Text(displayMeal.title)),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  displayMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildSectionContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        displayMeal.ingredients[index],
                      ),
                    ),
                  ),
                  itemCount: displayMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildSectionContainer(ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).accentColor,
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(displayMeal.steps[index]),
                    ),
                    Divider(
                      color: Colors.green,
                    )
                  ],
                ),
                itemCount: displayMeal.steps.length,
              )),
            ],
          ),
        ));
  }
}
