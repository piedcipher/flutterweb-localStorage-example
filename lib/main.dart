import 'dart:html';
import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness _appTheme = Brightness.light;

  @override
  void initState() {
    super.initState();
    if (window.localStorage.containsKey('theme')) {
      _appTheme = window.localStorage['theme'] == 'Dark'
          ? Brightness.dark
          : Brightness.light;
    } else {
      window.localStorage['theme'] = 'Light';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LocalStorage Example',
      theme: ThemeData(
        brightness: _appTheme,
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('LocalStorage Exmaple'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                String currentTheme = window.localStorage['theme'];
                String newTheme = currentTheme == 'Dark' ? 'Light' : 'Dark';
                window.localStorage['theme'] = newTheme;
                setState(() {
                  _appTheme =
                      newTheme == 'Dark' ? Brightness.dark : Brightness.light;
                });
              },
              icon: Icon(Icons.wb_sunny),
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Click on sun icon in appbar to toggle app theme.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
