import 'package:flutter_application_1/food/model/datasource/api_datasource.dart';

abstract class Repository{
  Future <List> fetchData(); 
}

class FoodRepository implements Repository{
  final FoodApiDataSource api = FoodApiDataSource();

  @override
  Future<List> fetchData() {
    return api.fetchFoodData();
  }
}