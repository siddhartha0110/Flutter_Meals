import 'package:flutter/material.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.tealAccent,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Colors.grey),
              body2: TextStyle(color: Colors.grey),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ))),
      //home: TabsScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
        '/category-meals': (ctx) => CategoryMealsScreen(),
        '/meal-detail': (ctx) => MealDetails(),
        '/filters': (ctx) => FiltersScreen()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
