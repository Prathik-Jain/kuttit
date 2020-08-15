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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  // widget
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String shorten(String longUrl) {
    // MAKE a api call to the KUTT IT lib and get the short url
    return "";
  }

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
              decoration: InputDecoration(
                labelText: "LOOOOOOOOONG URL",
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {},
              color: Colors.blueAccent,
              child: Text("SHORTEN"),
            ),
            SizedBox(height: 20),
            Text("short url"),
          ],
        ),
      ),
    );
  }
}
