import 'package:flutter/material.dart';
import 'package:flutter_various_app/view/splash_screen_ui.dart';

void main(){
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreenUI(),
        theme: ThemeData(
          fontFamily: 'Kanit',
        ),
      )
    );
}