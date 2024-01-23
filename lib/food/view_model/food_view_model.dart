import 'package:flutter/material.dart';
import 'package:flutter_application_1/food/model/food_model.dart';
import 'package:flutter_application_1/food/model/food_repository.dart';

class FoodViewModel extends ChangeNotifier {
  final FoodRepository _food = FoodRepository();

  List<FoodModel> foodList = [];
  bool isDataLoaded = false;
  bool hasError = false;
  bool isFetchingData = false;

  Future<void> fetchData() async {
    try {
      isFetchingData = true;
      notifyListeners();

      foodList = await _food.fetchData() as List<FoodModel>;
      isDataLoaded = true;
      hasError = false;
    } catch (error) {
      print('Error fetching data: $error');
      hasError = true;
    } finally {
      isFetchingData = false;
      notifyListeners();
    }
  }
}
