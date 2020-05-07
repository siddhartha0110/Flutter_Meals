import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _veganFree = false;
  var _vegetarianFree = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _veganFree = widget.currentFilters['vegan'];
    _vegetarianFree = widget.currentFilters['vegetarian'];
  }

  Widget _buildSwitchListTile(
      String title, String description, Function updateValue, bool currentVal) {
    return SwitchListTile(
        title: Text(title),
        value: currentVal,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _veganFree,
                    'vegetarian': _vegetarianFree,
                  };
                  widget.saveFilters(selectedFilters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Meal Selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                      'Gluten-Free', 'Only include Gluten free meals',
                      (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  }, _glutenFree),
                  _buildSwitchListTile(
                      'Lactose-Free', 'Only include Lactose free meals',
                      (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  }, _lactoseFree),
                  _buildSwitchListTile(
                      'Vegetarian', 'Only include Vegetarian meals', (newVal) {
                    setState(() {
                      _vegetarianFree = newVal;
                    });
                  }, _vegetarianFree),
                  _buildSwitchListTile('Vegan', 'Only include Vegan meals',
                      (newVal) {
                    setState(() {
                      _veganFree = newVal;
                    });
                  }, _veganFree)
                ],
              ),
            ),
          ],
        ));
  }
}
