import 'package:Resume/custom_button.dart';
import 'package:Resume/custom_textfield.dart';
import 'package:Resume/global.dart';
import 'package:Resume/home.dart';
import 'package:Resume/SchoolEducation.dart';
import 'package:Resume/otherqualification.dart';
import 'package:flutter/material.dart';
import 'dart:core';


class Skill extends StatefulWidget {
  static const String routeNamed = 'Skill';

  @override
  _SkillState createState() => _SkillState();
}


class _SkillState extends State<Skill> {
  String course;
  String branch;
  String university;
  String passing_year;
  String percentage;
 
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  _navigateToOtherQualification() {
    Navigator.pushNamed(context,OtherQualification.routeNamed);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          title: Container(
              child: Text('Skill', style: TextStyle(color: Colors.black),)),
          backgroundColor: Colors.grey[100],
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 26,
            ),
            onPressed: _navigateToOtherQualification,
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
                        child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(color: Colors.grey,
                                            blurRadius: 3,
                                            offset: Offset(0, 5))
                                      ],
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage('assets/k.png'),
                                          fit: BoxFit.fill)),
                                ),
                             ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          CustomTextField(
                                            size: false,
                                            hintText: 'course',
                                            onSaved: (value) {
                                              course = value;
                                            },
                                          validator: requiredString,
                                          ),
                                CustomTextField(
                                  size: false,
                                  hintText: 'branch',
                                  onSaved: (value) {
                                    branch = value;
                                  },
                                  validator: requiredString,
                                ),
                            CustomTextField(
                              size: false,
                              hintText: 'university',
                              onSaved: (value) {
                                university = value;
                              },
                            validator: requiredString,

                            ),
                      CustomTextField(
                        size: false,
                        hintText: 'passing_year',
                        onSaved: (value) {
                          passing_year = value;
                        },
                          validator: requiredString,
                      ),
                         CustomTextField(
                        size: false,
                        hintText: 'percentage /CGPA',
                        onSaved: (value) {
                          percentage = value;
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
                                "course": course,
                                "branch": branch,
                                "university": university,
                                "passing_year": passing_year,
                                "percentage": percentage,
                                //"Currentcity": Currentcity,

                              });
                              Navigator.pushNamed(context, School.routeNamed);
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


