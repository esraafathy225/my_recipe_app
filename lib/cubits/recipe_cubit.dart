import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_recipe_app/cubits/recipe_state.dart';
import 'package:my_recipe_app/services/recipe_service.dart';

class RecipeCubit extends Cubit<RecipeState>{

  RecipeCubit() : super(RecipeInitial()){
    getRecipes();
  }

  final RecipeService recipeService = RecipeService();

  void getRecipes() async{
    emit(RecipeLoading());
    try{
      final result = await  recipeService.getRecipes();
      emit(RecipeLoaded(recipes: result));
    }catch(e){
      emit(RecipeError(message: e.toString()));
    }

  }
}