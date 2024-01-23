import 'package:flutter/material.dart';
import 'package:flutter_application_1/food/view/widgets/food_component.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/food/view_model/food_view_model.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodViewModel>(
      builder: (context, foodViewModel, child) {
        if (!foodViewModel.isDataLoaded) {
          return const Center(child: CircularProgressIndicator());
        } else if (foodViewModel.hasError) {
          return const Text('Error loading data');
        } else {
          return ListView.builder(
            itemCount: foodViewModel.foodList.length,
            itemBuilder: (context, index) {
              final food = foodViewModel.foodList[index];
              return FoodComponent(model: food);
            },
          );
        }
      },
    );
  }
}
