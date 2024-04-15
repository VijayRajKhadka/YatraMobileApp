import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/app/app.locator.dart';
import 'package:yatra/services/recommendation_services.dart';

import '../../../../../model/recommendedTrek.dart';

class RecommendationViewModel extends BaseViewModel {
  final TextEditingController budget = TextEditingController();
  final RecommendationServices recommendationServices =
  locator<RecommendationServices>();
  late List<RecommendationTrek> data = []; // Initialize data as an empty list
  bool isLoading = false;

  Future<void> findTrek(String budget) async {
    final budgetInt = int.parse(budget);
    // Set isLoading to true to show the loading indicator
    isLoading = true;
    notifyListeners(); // Notify listeners to update the UI

    try {
      // Simulate loading for 3 seconds
      await Future.delayed(Duration(seconds: 3));

      final response =
      await recommendationServices.getRecommendationData(budgetInt);
      if (response.isNotEmpty) {
        data = response;
        notifyListeners(); // Notify listeners to update the UI
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      // Set isLoading to false after loading is complete
      isLoading = false;
      notifyListeners(); // Notify listeners to update the UI
    }
  }
}


