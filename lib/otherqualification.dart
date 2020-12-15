import 'package:Resume/custom_button.dart';
import 'package:Resume/custom_textfield.dart';
import 'package:Resume/global.dart';
import 'package:Resume/home.dart';
import 'package:Resume/SchoolEducation.dart';
import 'package:Resume/skill.dart';
import 'package:flutter/material.dart';
import 'dart:core';


class OtherQualification extends StatefulWidget {
  static const String routeNamed = 'OtherQualification';

  @override
  _OtherQualificationState createState() => _OtherQualificationState();
}


class _OtherQualificationState extends State<OtherQualification> {
  String duniversity;
  String dpassingyear;
  String dmarks;
  String oggraduation;
  String oguniversity;
  String ogpassing_year;
  String ogmarks;
 
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  _navigateToSchool() {
    Navigator.pushNamed(context,HomePage.routeNamed);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          title: Container(
              child: Text('Other Qualification', style: TextStyle(color: Colors.black),)),
          backgroundColor: Colors.grey[100],
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 26,
            ),
            onPressed: _navigateToSchool,
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
                      Text("Dipolma"),
                        SizedBox(
                     height: 16,
                   ),
                                          CustomTextField(
                                            size: false,
                                            hintText: 'University',
                                            onSaved: (value) {
                                              duniversity = value;
                                            },
                                          validator: requiredString,
                                          ),
                                CustomTextField(
                                  size: false,
                                  hintText: 'Passing Year',
                                  onSaved: (value) {
                                    dpassingyear = value;
                                  },
                                  validator: requiredString,
                                ),
                            CustomTextField(
                              size: false,
                              hintText: 'Marks',
                              onSaved: (value) {
                                dmarks = value;
                              },
                            validator: requiredString,

                            ),
                        Text("Other Graduations"),
                        CustomTextField(
                        size: false,
                        hintText: 'University',
                        onSaved: (value) {
                          oguniversity = value;
                        },
                          validator: requiredString,
                      ),
                         CustomTextField(
                        size: false,
                        hintText: 'Passing Year',
                        onSaved: (value) {
                          ogpassing_year = value;
                        },
                          validator: requiredString,
                      ),
                      CustomTextField(
                        size: false,
                        hintText: 'Marks',
                        onSaved: (value) {
                          ogmarks = value;
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
                                  .collection('education')
                                  .document()
                                  .setData({
                                "D University": duniversity,
                                "D Passing Year": dpassingyear,
                                "D marks": dmarks,
                                "Other Graduation": oggraduation,
                                "O university": oguniversity,
                                "O Passing Year": ogpassing_year,
                                  "O Marks":ogmarks,

                              });
                              Navigator.pushNamed(context, Skill.routeNamed);
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


