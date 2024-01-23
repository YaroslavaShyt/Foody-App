import 'package:flutter_application_1/food/model/food_model.dart';
import 'package:dio/dio.dart';

abstract class FoodService {
  Future<List<FoodModel>> fetchFoodData();
}

class FoodApiDataSource implements FoodService {
  final Dio dio = Dio();

  @override
  Future<List<FoodModel>> fetchFoodData() async {
    List<FoodModel> data = [];
    try {
      final response = await dio.get(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=',
        options: buildOptions(),
      );
      if (response.statusCode == 200) {
        data = _parseResponse(response);
      }
      return data;
    } catch (e) {
      print(e.toString());
      return data;
    }
  }

  List<FoodModel> _parseResponse(Response response) {
    List<FoodModel> data = [];
    for (var i = 0; i < 10; i++) {
      data.add(FoodModel(
        area: response.data["meals"][i]["strArea"],
        picture: response.data["meals"][i]["strMealThumb"],
        title: response.data["meals"][i]["strMeal"],
      ));
    }

    return data;
  }

  Options buildOptions() {
    return Options(
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}
