import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/views/home_view/common/top_nav_view/top_nav_view_mode.dart';

class TopNavView extends StackedView<TopNavViewModel> {
  final double width;
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  final Color borderColor;

  const TopNavView(
      {required this.width,
      required this.icon,
      required this.text,
      required this.borderColor,
      this.onTap,
      super.key});

  @override
  Widget builder(
      BuildContext context, TopNavViewModel viewModel, Widget? child) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.055,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 5, color: borderColor),
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 23),
              const SizedBox(width: 5), // Add some space between icon and text
              Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  TopNavViewModel viewModelBuilder(BuildContext context) => TopNavViewModel();
}
