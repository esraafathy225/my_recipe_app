import 'package:flutter/material.dart';
import 'package:my_recipe_app/models/recipe.dart';

class RecipeWidget extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  const RecipeWidget({super.key,required this.recipe,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                recipe.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ])),
            ),
            Positioned(
                top: 15,
                left: 15,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        recipe.rating.toString(),
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )),
            Positioned(
                bottom: 15,
                right: 15,
                child: Text(
                  '${recipe.caloriesPerServing} Kcal',
                  style: TextStyle(color: Colors.white),
                )),
            Positioned(
                bottom: 15,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text('${recipe.ingredients.length} Ingredients', style: TextStyle(color: Colors.white))
                  ],
                )),
            Positioned(
                right: 15,
                top: 15,
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
