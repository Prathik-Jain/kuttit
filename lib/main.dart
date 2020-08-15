import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// statefull widgets are widgets which has "state"
// state is any data which may change in the lifetime of the app
// 1. maintain the state
// 2. tell flutter to rebuild that particular widget

// sateless
// - does not have an changing data

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  // widget
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String shortUrl = "";

  // List - [1,2,3,4,2,2,2..]
  // Map = {"name": "qikpik", "startedOn": "July 2020", ...}
  // Set - (unique list) - {1,2,3,4,...}

  String shorten(String longUrl) {
    // MAKE a api call to the KUTT IT lib and get the short url
    const url = "https://kutt.it/api/v2/links";
    // Future<T> - future - I will compute this, but i dont know
    // how long this is going to take,
    // in the FUTURE

    // Future<Response>
    //once it returns then, we take resp and then do
    // whatever we want to do with it.
    // Lambda functions
    http.post(
      url,
      headers: {
        "X-API-KEY": "aqdNIhBKTBkJWS_rUY2p9CY8HpqKdvfgUwTqGNAR",
      },
      body: {
        "target": longUrl,
      },
    ).then((res) {
      Map body = json.decode(res.body);
      String link = body['link'];

      setState(() {
        shortUrl = link;
      });
    });
  }

  TextEditingController _longUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // we need a text field where you can put a long url
    // text which will be the short url
    // a botton
    return Scaffold(
      appBar: AppBar(
        title: Text("URL Shortner"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _longUrlController,
              decoration: InputDecoration(
                labelText: "LOOOOOOOOONG URL",
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                shorten(_longUrlController.text);
              },
              color: Colors.blueAccent,
              child: Text("SHORTEN"),
            ),
            SizedBox(height: 20),
            Text(
              shortUrl,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
