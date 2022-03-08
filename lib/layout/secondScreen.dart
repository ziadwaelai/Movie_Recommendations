import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  String url, title, plot, score;
  SecondScreen(this.plot, this.title, this.url, this.score, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Image.network(url),
            Center(
              child: Text(
                title,
                style:const  TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.grey),
              ),
            ),
          const   SizedBox(
              height: 10,
            ),
            Text(
              plot,
              style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
