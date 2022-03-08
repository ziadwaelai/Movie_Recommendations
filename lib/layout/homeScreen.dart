import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie/components/api.dart';
import 'package:movie/components/components.dart';
import 'package:movie/components/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  Timer? timer;
  int num = 20;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: num), (Timer t) {
      setState(() {
        print(num);
        cleaPref();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[600],
          onPressed: () {
            setState(() {
              cleaPref();
            });
          },
          child: const Icon(Icons.change_circle_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.black87,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: getMovieList(),
              builder: (context, snapshot) {
                if (movieData.isNotEmpty &&
                    snapshot.hasData &&
                    movieData["Title"] != null ) {
                  return Center(
                    child: moviePoster(movieData["Poster"], movieData["Year"],
                        movieData["Genre"], movieData["imdbRating"],movieData["Plot"],movieData["Title"],context),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
              
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: textEditingController,
                onSubmitted: (value) {
                  setState(() {
                    if (value == null) {
                      num = int.parse("10");
                    } else {
                      num = int.parse(value);
                    }
                  });
                },
              ),
            )
          ],
        ));
  }
}
