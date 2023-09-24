import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/filters';

  final Function saveFilters;
  final Map<String, bool>currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

   bool _glutenFree = false;
   bool _lactoseFree = false;
   bool _vegan = false;
   bool _vegetarian = false;

   @override
    initState() {
      _glutenFree = widget.currentFilters['gluten'];
      _lactoseFree = widget.currentFilters['lactose'];
      _vegan = widget.currentFilters['vegetarian'];
      _vegetarian = widget.currentFilters['vegan '];
    super.initState();
  }

   Widget buildSwitchListTile(String title, String description, bool currentValue, Function updateValue){
     return SwitchListTile(
       title: Text(title),
       value: currentValue ?? false,
       subtitle: Text(description),
       onChanged: updateValue,
     );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters"),actions: [
        IconButton(
          icon: Icon(Icons.save),
          onPressed: (){
            final Map<String, bool> selectedFilters ={
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };


            widget.saveFilters(selectedFilters);
          },
        )
      ],),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection.", style: Theme.of(context).textTheme.subtitle1,),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile('Gluten-free', "Only include gluten-free meals.", _glutenFree, (newValue){
                setState(() {
                  _glutenFree = newValue;
                });
              },
              ),

              buildSwitchListTile('Lactose-free', "Only include Lactose-free meals.", _lactoseFree, (newValue){
                setState(() {
                  _lactoseFree = newValue;
                });
              },
              ),

              buildSwitchListTile('Vegetarian', "Only include vegetarian meals.", _vegetarian, (newValue){
                setState(() {
                  _vegetarian = newValue;
                });
              },
              ),

              buildSwitchListTile('Vegan', "Only include vegan meals.", _vegan, (newValue){
                setState(() {
                  _vegan = newValue;
                });
              },
              ),

            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
