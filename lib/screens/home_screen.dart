import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_recipe_app/cubits/recipe_cubit.dart';
import 'package:my_recipe_app/cubits/recipe_state.dart';
import 'package:my_recipe_app/models/recipe.dart';

import '../widgets/recipe_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFFE23E3E),
                Color(0xFFFF6B6B),
                Color(0xFFFFB3B3)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
        ),
        title: const Text(
          'Recipe App',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<RecipeCubit,RecipeState>(builder: (context,state){
        if(state is RecipeLoading){
          return Center(child: CircularProgressIndicator(color: Color(0xFFE23E3E),));
        }
        else if (state is RecipeError){
          return Center(child: Text(state.message));
        }
        else if (state is RecipeLoaded){
          return ListView.builder(
              itemCount: state.recipes.length,
              itemBuilder: (context, index) {
                return RecipeWidget(
                  recipe: state.recipes[index],
                  onTap: (){},
                );
              });
        }else{
          return Center(child: Text('No Recipes Found'));
        }
      }),
    );
  }
}
