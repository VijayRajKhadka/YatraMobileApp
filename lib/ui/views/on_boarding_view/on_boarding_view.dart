import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import 'on_boarding_view_model.dart';

class OnBoardingView extends StackedView<OnBoardingViewModel> {
  const OnBoardingView({super.key});

  @override
  Widget builder(BuildContext context, OnBoardingViewModel viewModel,
      Widget? child) {
    return Center(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height*0.8,
            child: PageView.builder(
              controller: viewModel.pageController,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: viewModel.pages[index],
                );

              },),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed:(viewModel.currentIndex!=0)?viewModel.onPrevious:(){},
                  style: ElevatedButton.styleFrom(
                  backgroundColor: viewModel.currentIndex!=0?Colors.indigoAccent:Colors.white24,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                  ),

                  child: const Text("Previous")

              ),

              ElevatedButton(onPressed:(viewModel.currentIndex!=3)?viewModel.onNext:viewModel.goToLoginPage,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15, right: 30),
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                  child: const Text("Next")),
            ],
          ),


        ],
      ),);
  }

  @override
  OnBoardingViewModel viewModelBuilder(BuildContext context) =>
      OnBoardingViewModel();

}