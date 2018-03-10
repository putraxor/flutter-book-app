import 'package:book_app/data.dart';
import 'package:book_app/detail.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Book App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
        platform: TargetPlatform.iOS,
      ),
      home: Home(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }

  ///Generate parameterized route --> e.g: detail/some book title
  generateRoute(RouteSettings settings) {
    final path = settings.name.split('/');
    final title = path[1];

    Book book = books.firstWhere((it) => it.title == title);
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => Detail(book),
    );
  }
}
