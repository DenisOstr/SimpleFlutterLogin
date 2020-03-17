import 'package:flutter/material.dart';

import 'Pages/loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fresh Login App",
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Fresh Login"),
        // ),
        body: LoginPage(),
      ),
    );
  }
}