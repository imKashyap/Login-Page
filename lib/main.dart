import 'package:flutter/material.dart';
import 'package:login/blocs/provider.dart';
import 'src/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Log Me In!',
          home: LoginScreen(),
      ),
    );
  }
}