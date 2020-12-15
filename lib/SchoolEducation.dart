import 'package:Resume/custom_button.dart';
import 'package:Resume/custom_textfield.dart';
import 'package:Resume/global.dart';
import 'package:Resume/home.dart';
import 'package:Resume/SchoolEducation.dart';
import 'package:Resume/otherqualification.dart';
import 'package:Resume/lastpage.dart';
import 'package:flutter/material.dart';
import 'dart:core';


class School extends StatefulWidget {
  static const String routeNamed = 'School';

  @override
  _SchoolState createState() => _SchoolState();
}


class _SchoolState extends State<School> {
  String ssboard;
  String sspassingyear;
  String ssmarks;
  String sspercentageorcgpa;
  String hsboard;
  String hspassingyear;
  String hsmarks;
  String hspercentageorcgpa;

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  _navigateToHomePage() {
    Navigator.pushNamed(context,HomePage.routeNamed);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
              child: Text('School', style: TextStyle(color: Colors.black),)),
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
                child: Form(
                  key:form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Center(
                        child: new Text("School"),

                        ),

                      SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        size: false,
                        hintText: 'Board',
                        onSaved: (value) {
                          ssboard = value;
                        },
                        validator: requiredString,
                      ),
                      CustomTextField(
                        size: false,
                        hintText: 'Passing Year',
                        onSaved: (value) {
                          sspassingyear = value;
                        },
                        validator: requiredString,
                      ),
                      CustomTextField(
                        size: false,
                        hintText: 'Marks',
                        onSaved: (value) {
                          ssmarks = value;
                        },
                        validator: requiredString,

                      ),
                      CustomTextField(
                        size: false,
                        hintText: 'Percentage/CGPA',
                        onSaved: (value) {
                          sspercentageorcgpa = value;
                        },
                        validator: requiredString,
                      ),
                      Text("Senior Secondary School"),
                      CustomTextField(
                        size: false,
                        hintText: 'Board',
                        onSaved: (value) {
                          hsboard = value;
                        },
                        validator: requiredString,
                      ),
                      CustomTextField(
                        size: false,
                        hintText: 'Passing Year',
                        onSaved: (value) {
                          hspassingyear = value;
                        },
                        validator: requiredString,
                      ),                      CustomTextField(
                        size: false,
                        hintText: 'Marks',
                        onSaved: (value) {
                          hsmarks = value;
                        },
                        validator: requiredString,
                      ),                      CustomTextField(
                        size: false,
                        hintText: 'Percentage/CGPA',
                        onSaved: (value) {
                          hspercentageorcgpa = value;
                        },
                        validator: requiredString,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                        labelText: ' Save and Next',
                        isLoading: false,
                        postIcon: Icons.arrow_forward,
                        visiblepostIcon: true,
                        onTap: () async {

                          form.currentState.save();
                          if (form.currentState.validate()) {
                            try {
                              await firestore
                                  .collection('sss')
                                  .document()
                                  .setData({
                                " HS Board": ssboard,
                                " HS Passing Year":sspassingyear,
                                " HS Marks":ssmarks,
                                "HS Percentage":sspercentageorcgpa,
                                " SS Board": hsboard,
                                "SS Passing Year":hspassingyear,
                                "SS Marks":hsmarks,
                                "SS Percentage":hspercentageorcgpa,

                                //"Currentcity": Currentcity,

                              });
                              Navigator.pushNamed(context, OtherQualification.routeNamed);
                            } catch (e) {
                              print("signup error");
                              print(e);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}


