import 'package:flutter/material.dart';
import 'package:myschool/Utils/utils.dart';
import 'package:provider/provider.dart';

import 'Screens/HomePage.dart';
import 'Services/Network.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<WebServices>(
      create: (context) => WebServices(),
    ),
    ChangeNotifierProvider<Utils>(
      create: (context) => Utils(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MySchoolApp(),
    );
  }
}
