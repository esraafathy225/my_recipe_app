import 'package:flutter/cupertino.dart';
import 'package:my_recipe_app/models/recipe.dart';

@immutable
abstract class RecipeState{}

class RecipeInitial extends RecipeState{}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState{
  final List<Recipe> recipes;
  RecipeLoaded({required this.recipes});
}

class RecipeError extends RecipeState{
  final String message;
  RecipeError({required this.message});
}

