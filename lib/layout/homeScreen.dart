import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:movie/components/api.dart';
import 'package:movie/components/components.dart';
import 'package:movie/components/widgets.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              cleaPref();
            });
          },
        ),
        backgroundColor: Colors.black87,
        body: FutureBuilder(
          future: getMovieList(),
          builder: (context, snapshot) {
            if (movieData.isNotEmpty || decodedMap.isNotEmpty) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  children: [
                    Text(
                      movieData["Title"] == "N/A"
                          ? "NO Plot"
                          : movieData["Title"],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      movieData["Plot"] == "N/A"
                          ? "NO Plot"
                          : movieData["Plot"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                        height: 500,
                        child: Image(image: NetworkImage(movieData["Poster"])))
                  ],
                ),
              ));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
