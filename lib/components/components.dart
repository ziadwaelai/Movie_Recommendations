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

getPref() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var map = preferences.getString("data");
  if (map == null) {
    await getRandomMovie()
        .then((e)  =>  getMovie(e).then((value)  {
              movieData = value;
               savePref(value);
            }));
  }
  decodedMap = await json.decode(map!);

  return decodedMap;
}

void cleaPref() async {
  decodedMap = {};
  movieData = {};
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
  getMovieList();
}
