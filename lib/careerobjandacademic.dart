import 'package:Resume/custom_button.dart';
import 'package:Resume/custom_textfield.dart';
import 'package:Resume/global.dart';
import 'package:Resume/home.dart';
import 'package:Resume/SchoolEducation.dart';
import 'package:flutter/material.dart';
import 'dart:core';


class Education extends StatefulWidget {
  static const String routeNamed = 'Education';

  @override
  _EducationState createState() => _EducationState();
}


class _EducationState extends State<Education> {
  String cobjective;
  String skills;
  String course;
  String branch;
  String university;
  String passing_year;
  String percentage;
 
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
              child: Text(' Career Objective and Academic Qualification', style: TextStyle(color: Colors.black),)),
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
                          Text("Career Objective"),
                              CustomTextField(
                                size: false,
                                hintText: 'Career Objective',
                                onSaved: (value) {
                                  cobjective = value;
                                },
                                validator: requiredString,
                              ),
                          Text("Skills"),
                              CustomTextField(
                                size: false,
                                hintText: 'Skill 1',
                                onSaved: (value) {
                                  skills = value;
                                },
                                validator: requiredString,
                              ),
                              CustomTextField(
                                size: false,
                                hintText: 'Skill 2',
                                onSaved: (value) {
                                  skills = value;
                                },
                                validator: requiredString,
                              ),

                              CustomTextField(
                                size: false,
                                hintText: 'Skill 3',
                                onSaved: (value) {
                                  skills = value;
                                },
                                validator: requiredString,
                              ),
                              CustomTextField(
                                size: false,
                                hintText: 'Skill 4',
                                onSaved: (value) {
                                  skills = value;
                                },
                                validator: requiredString,
                              ),

                              CustomTextField(
                                size: false,
                                hintText: 'Skill 5',
                                onSaved: (value) {
                                  skills = value;
                                },
                                validator: requiredString,
                              ),

                          Text("Academic Qualification"),
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
                                  "Career Objective":cobjective,
                                  "SKill1":skills,
                                  "Skill2":skills,
                                  "Skill3":skills,
                                  "Skill 4":skills,
                                  "skill5":skills,
                                "course": course,
                                "branch": branch,
                                "university": university,
                                "passing_year": passing_year,
                                "percentage": percentage,
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


