import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rating Slider',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double rating = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Rating Slider',
              style: TextStyle(color: Colors.black, fontSize: 22)),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Rating: $rating",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(height: 30),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        minimumSize: Size(180.0, 30.0),
                        backgroundColor: Colors.black,
                        elevation: 3,
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () => showRating(),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      );

  Widget buildRating() => RatingBar.builder(
      initialRating: rating,
      itemCount: 5,
      minRating: 1,
      itemPadding: EdgeInsets.symmetric(horizontal: 4),
      updateOnDrag: true,
      onRatingUpdate: (rating) => setState(() => this.rating = rating),
      itemBuilder: (context, index) => Icon(
            Icons.star,
            color: Colors.amber,
          ));

  void showRating() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Rate this App"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Please leave a start rating."),
              SizedBox(height: 20),
              buildRating(),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Okay",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      );
}
