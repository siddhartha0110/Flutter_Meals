import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Favorites',
    }
  ];

  int _selectedTabIndex = 0;
  void _selectedTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedTabIndex]['title'])),
      drawer: MainDrawer(),
      body: _pages[_selectedTabIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedTabIndex,
        //type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories')),
          BottomNavigationBarItem(
              //backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              title: Text('Favorites')),
        ],
      ),
    );
  }
}
