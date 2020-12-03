import 'package:Resume/home.dart';
import 'package:flutter/material.dart';

class Resume extends StatefulWidget {
  static const String routeNamed = 'resume';

  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {


  _navigateToHomePage() {
    Navigator.pushNamed(context,HomePage.routeNamed);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          title: Container(
              child: Text('Resume', style: TextStyle(color: Colors.black),)),
          backgroundColor: Colors.grey[100],
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 26,
            ),
            onPressed: _navigateToHomePage,
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              child: SingleChildScrollView(
                              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                  ],
                ),
              )),
        ),
      ),
    );
  }
}


