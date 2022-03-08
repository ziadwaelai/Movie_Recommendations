import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movie/layout/secondScreen.dart';

Widget moviePoster(String url, String year, String genre, String score,String plot,String title ,context) {
  return GestureDetector(
    onTap: () => Navigator.push(context, MaterialPageRoute(builder:  (context) =>  SecondScreen(plot,title,url,score))),
    child: Container(
      height: 270,
      width: 190,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Colors.white12.withOpacity(.05),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black12.withOpacity(.5),
                      borderRadius: const BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "$year | $genre",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.9)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AutoSizeText(
                            "⭐$score",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.9)),
                          ),
                        ],
                      ))),
            ),
          ],
        ),
      ),
    ),
  );
}
