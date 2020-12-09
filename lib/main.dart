import 'package:Resume/home.dart';
import 'package:Resume/education.dart';
import 'package:Resume/secondaryschool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Personal Information',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
        initialRoute: HomePage.routeNamed,
        routes: {
          HomePage.routeNamed: (BuildContext context) => HomePage(),
          Education.routeNamed: (BuildContext context) => Education(),
          SecondaryEdu.routeNamed:(BuildContext context)=>SecondaryEdu(),
          //Education,job,internship,Postition of responsibility,training,project,skills,worksamples,addition details
        }
        );
  }
}
