import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/views/home_view/pages/recommendation_screen/recommendation_screen_view_model.dart';

class RecommendationView extends StatelessWidget {
  const RecommendationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecommendationViewModel>.reactive(
      viewModelBuilder: () => RecommendationViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "LET'S FIND SUITABLE TREK FOR YOU ACCORDING TO YOUR BUDGET USING ML",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: viewModel.budget,
                decoration: const InputDecoration(
                  labelText: 'Enter Budget ',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => viewModel.findTrek(viewModel.budget.text.toString()),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(15),
                  ),
                  child: viewModel.isLoading
                      ? const CircularProgressIndicator() // Show loading indicator if isLoading is true
                      : const Text(
                    'Find',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              // Check if data is not null before building UI
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewModel.data.length,
                  itemBuilder: (context, index) {
                    final trek = viewModel.data[index];
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trek.trek,
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Best Travel Time: ${trek.bestTravelTime}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Cost: \$ ${trek.cost}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green
                            ),
                          ),
                          Text(
                            'Max Altitude: ${trek.maxAltitude} meters',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Time: ${trek.time} days',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Trip Grade: ${trek.tripGrade}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  @override
  RecommendationViewModel viewModelBuilder(BuildContext context) =>
      RecommendationViewModel();
}
