import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/views/home_view/pages/add_screen/add_view_model.dart';

class AddView extends StackedView<AddViewModel> {
  const AddView({super.key});

  @override
  Widget builder(BuildContext context, AddViewModel viewModel, Widget? child) {
    return  SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 50.0),
            child: Text("What do you want to Add?",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black54
            ),),
          ),
          InkWell(
            onTap: viewModel.launchTrek,
            child: Container(
              color: Colors.greenAccent,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.hiking, color:  Colors.white, size: 35,),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("ADD TREK", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                  )],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: viewModel.launchPlace,
            child: Container(
              color: Colors.lightBlue,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.place_outlined, color:  Colors.white, size: 35,),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("ADD PLACE", style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    )],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: viewModel.launchRestaurant,
            child: Container(
              color: Colors.red,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.restaurant, color:  Colors.white, size: 35,),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("ADD RESTAURANT", style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    )],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  AddViewModel viewModelBuilder(BuildContext context) => AddViewModel();
}
