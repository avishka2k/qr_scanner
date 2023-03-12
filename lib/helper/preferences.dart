// ignore_for_file: camel_case_types

import 'package:shared_preferences/shared_preferences.dart';

List<String> saveListTitle = [];
List<String> saveListDate = [];
List<String> recentTitle = [];
List<String> recentDate = [];

class preferencesClass {
  saveTitleData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('saveTitleKey', saveListTitle);
  }

  saveDateData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('saveDateKey', saveListDate);
  }

  recentTitleData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('recentTitleKey', recentTitle);
  }

  recentDateData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('recentDateKey', recentDate);
  }

  loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    saveListTitle = prefs.getStringList('saveTitleKey') ?? [];
    saveListDate = prefs.getStringList('saveDateKey') ?? [];
    recentTitle = prefs.getStringList('recentTitleKey') ?? [];
    recentDate = prefs.getStringList('recentDateKey') ?? [];
  }
}
