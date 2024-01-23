import 'package:flutter/material.dart';
import 'package:flutter_application_1/food/view/widgets/food_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/food/view_model/food_view_model.dart';

class FoodView extends StatelessWidget {
  static const String id = "food";

  const FoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Foody',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF6FB08A),
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Food List',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
      body: Consumer<FoodViewModel>(
        builder: (context, foodViewModel, child) {
          if (!foodViewModel.isDataLoaded && !foodViewModel.isFetchingData) {
            Future.delayed(Duration.zero, () {
              foodViewModel.fetchData();
            });
          }

          return const FoodList();
        },
      ),
      backgroundColor: const Color(0xFF6FB08A),
    );
  }
}
