import 'package:flutter/material.dart';
import 'package:traveldiary/SecondScreen/JournalDetailsScreen.dart';

/// description:
/// project: travel_diary
/// @package:
/// @author: dammyololade
/// created on: 07/05/2020
class RouteManager {
  static String journalDetails = "/journalDetails";

  static Map<String, Widget Function(BuildContext context)> get routes =>
      {journalDetails: (context) => JournalDetailsScreen()};
}
