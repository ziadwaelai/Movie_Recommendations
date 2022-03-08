import 'package:http/http.dart';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:movie/components/components.dart';

Future<String> getRandomMovie() async {
  var response =
      await get(Uri.parse("https://k2maan-moviehut.herokuapp.com/api/random"));
  var data = await jsonDecode(response.body);
  return data["name"];
}

Future getMovie(String name) async {
  if (decodedMap.isNotEmpty) {
    print("object");
    return decodedMap;
  }
  var response = await get(
      Uri.parse("https://www.omdbapi.com/?t=$name&plot=full&apikey=756a45a2"));
  var data = await jsonDecode(response.body);
  return data;
}

Future getMovieList() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if ((connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.mobile)) {
    print("connected");
    getPref();
    if (decodedMap.isNotEmpty) {
      movieData = decodedMap;
      return movieData;
    } else {
      await getRandomMovie()
          .then((e) async => await getMovie(e).then((value) async {
                movieData = value;
                await savePref(value);
              }));
      return movieData;
    }
  } else {
    print("disconnected");
    await getPref();
    movieData = decodedMap;
    return movieData;
  }
}
