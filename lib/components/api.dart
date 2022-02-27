import 'package:http/http.dart';
import 'dart:convert';

import 'package:movie/components/components.dart';

Future<String> getRandomMovie() async {
  var response =
      await get(Uri.parse("https://k2maan-moviehut.herokuapp.com/api/random"));
  var data = await jsonDecode(response.body);
  return data["name"];
}

Future getMovie(String name) async {
  if (decodedMap.isNotEmpty) {
    return decodedMap;
  }
  var response = await get(
      Uri.parse("https://www.omdbapi.com/?t=$name&plot=full&apikey=756a45a2"));
  var data = await jsonDecode(response.body);
  return data;
}

Future<void> getMovieList() async {
  getPref();
  if (decodedMap.isNotEmpty) {
    movieData = decodedMap;
  } else {
    await getRandomMovie()
        .then((e) async => await getMovie(e).then((value) async {
              movieData = value;
              await savePref(value);
            }));
  }
}
