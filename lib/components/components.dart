import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'api.dart';

Map<String, dynamic> decodedMap = {};
Map<String, dynamic> movieData = {};

savePref(Map<String, dynamic> map) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String encodeMap = jsonEncode(map);
  preferences.setString("data", encodeMap);
}

void getPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var map = preferences.getString("data");
  decodedMap = await json.decode(map!);
}

void cleaPref() async {
  decodedMap = {};
  movieData = {};
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
  getMovieList();
  print(movieData);
}
