import 'package:flutter/material.dart';
import 'package:smart_query/Utils/Temas.dart';
import 'Login.dart';

class SmartQueryApp extends StatelessWidget {
  const SmartQueryApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartQueryAPP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Temas.azulPadrao,
      ),
      home: Login(), //Smartquerymailing()
    );
  }
}
