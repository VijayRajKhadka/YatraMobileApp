import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/model/historical_place.dart';
import 'package:yatra/ui/views/journey_view/journey_view_model.dart';

class JourneyView extends StackedView<JourneyViewModel> {
  final HistoricalPlaceModel historicalPlaceModel;

  const JourneyView({required this.historicalPlaceModel, super.key});

  @override
  Widget builder(
    BuildContext context,
    JourneyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          historicalPlaceModel.name,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          iconSize: 32, // Set the size of the icon here
          onPressed: () {
            viewModel.voiceHelper.stop();
            viewModel.navigationService.back();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView.builder(
                  controller: viewModel.pageController,
                  itemCount: historicalPlaceModel.historicalMonuments.length,
                  itemBuilder: (context, index) {
                    final monument =
                        historicalPlaceModel.historicalMonuments[index];
                    viewModel.voiceHelper.speak(monument.description);
                    return Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.network(
                              monument.monumentImageUrl,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.4,
                              fit: BoxFit.cover,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.play_arrow,
                                    size: 30,
                                    color: Colors.green,
                                  ),
                                  // Your trailing icon
                                  onPressed: () async {
                                    viewModel.voiceHelper
                                        .speak(monument.description);
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.pause,
                                    size: 30,
                                    color: Colors.blue,
                                  ),
                                  // Your trailing icon
                                  onPressed: () async {
                                    viewModel.voiceHelper.pause();
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.stop,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  // Your trailing icon
                                  onPressed: () async {
                                    viewModel.voiceHelper.stop();
                                  },
                                ),
                              ],
                            ),
                            Text(
                              monument.name,
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Scrollbar(
                                thickness: 3,
                                interactive: true,
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      monument.description,
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: (viewModel.currentIndex != 0)
                      ? viewModel.onPrevious
                      : () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: viewModel.currentIndex != 0
                          ? Colors.indigoAccent
                          : Colors.white24,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text("Previous"),
                ),
                ElevatedButton(
                  onPressed: (viewModel.currentIndex !=
                          historicalPlaceModel.historicalMonuments.length - 1)
                      ? viewModel.onNext
                      : viewModel.gotBack,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.only(
                        left: 30, top: 15, bottom: 15, right: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: viewModel.currentIndex !=
                          historicalPlaceModel.historicalMonuments.length - 1
                      ? const Text("Next")
                      : const Text("Finish"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  JourneyViewModel viewModelBuilder(BuildContext context) => JourneyViewModel();
}
