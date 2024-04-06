import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/ui/views/register_view/register_view_model.dart';

class RegisterView extends StackedView<RegisterViewModel>{
  const RegisterView({super.key});

  @override
  Widget builder(BuildContext context, RegisterViewModel viewModel, Widget? child) {
    return const Center(
      child: Text("Register"),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(BuildContext context) => RegisterViewModel();
  }
