import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yatra/services/event_services.dart';

import '../../../../../app/app.locator.dart';

class EventScreenViewModel extends BaseViewModel{
  final EventServices eventServices= locator<EventServices>();
}