import 'package:dio/dio.dart';

class RecipeService{

  final  _dio = Dio();

  void getRecipes() async {

    final result = await _dio.get('https://dummyjson.com/recipes');

    print(result);

  }
}