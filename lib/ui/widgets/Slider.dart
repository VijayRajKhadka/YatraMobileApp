import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yatra/services/review_services.dart';

import '../../app/app.locator.dart';

class SliderDialog extends StatefulWidget {
  const SliderDialog({super.key, required this.id});

  final int id;
  @override
  _SliderDialogState createState() => _SliderDialogState();
}

class _SliderDialogState extends State<SliderDialog> {
  double _sliderValue = 0.0;
  final ReviewServices _reviewServices = locator<ReviewServices>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[const Text('Rate'),
            IconButton(
              icon: Icon(Icons.close, size: 32,), color: Colors.red,
              onPressed: () {
                Navigator.of(context).pop();
              },

            ),] ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Slider(
            value: _sliderValue,
            onChanged: (newValue) {
              setState(() {
                _sliderValue = newValue;
              });
            },
            min: 0.0,
            max: 5.0,
            divisions: 40,
            label: _sliderValue.toString(),
          ),
          Text('Value: $_sliderValue'),
        ],
      ),
      actions: [

        ElevatedButton(
          onPressed: ()=> postRating(widget.id,),
          child: const Text('Rate'),
        ),

      ],
    );
  }

  postRating(id){
    _reviewServices.postRate(id, _sliderValue, isTrek: true).then((value){
      if(value==1){
        _sliderValue=0;
        Navigator.of(context).pop();
        EasyLoading.showToast("Thank You For Rating");
      }else{
        EasyLoading.showToast("Sorry, Failed");
      }
    }).onError((error, stackTrace) {
      EasyLoading.showToast("Pheri Hal");
    });

  }

}
