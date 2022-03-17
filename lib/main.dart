import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parallax_card/parallax_card_page.dart';
// ignore: import_of_legacy_library_into_null_safe

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: ParallexCardPage(),
    );
  }
}
