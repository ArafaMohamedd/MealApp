import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favoritesMeals;

  FavoritesScreen(this.favoritesMeals);


  @override
  Widget build(BuildContext context) {

    if(favoritesMeals.isEmpty){
      return Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            id: favoritesMeals[index].id,
            imageUrl: favoritesMeals[index].imageUrl,
            title: favoritesMeals[index].title,
            duration: favoritesMeals[index].duration,
            complexity: favoritesMeals[index].complexity,
            affordability: favoritesMeals[index].affordability,
          );
        },
        itemCount:favoritesMeals.length,
      );
    }

    return Container(
      child: Text("Favorites"),
    );
  }
}
