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
  String cocirrular;
  String achivement;
  String name;
  String destignation;
  String organisation;
 
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
              child: Text('Extra Activity and References', style: TextStyle(color: Colors.black),)),
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
                            Text("Co Cirrcular Activity"),
                          SizedBox(
                            height: 16,
                            ),
                              CustomTextField(
                                            size: false,
                                            hintText: 'Extra Activities',
                                            onSaved: (value) {
                                              cocirrular = value;
                                            },
                                          validator: requiredString,
                                          ),
                                CustomTextField(
                                  size: false,
                                  hintText: 'Extra Activities',
                                  onSaved: (value) {
                                    cocirrular = value;
                                  },
                                  validator: requiredString,
                                ),
                            Text("References"),
                            CustomTextField(
                              size: false,
                              hintText: 'name',
                              onSaved: (value) {
                                name = value;
                              },
                            validator: requiredString,

                            ),
                      CustomTextField(
                        size: false,
                        hintText: 'Designation',
                        onSaved: (value) {
                          destignation = value;
                        },
                          validator: requiredString,
                      ),
                         CustomTextField(
                        size: false,
                        hintText: 'Organisation',
                        onSaved: (value) {
                          organisation = value;
                        },
                          validator: requiredString,
                        ),
                        SizedBox(
                       height: 16,
                         ),
                          CustomButton(
                        labelText: ' Save ',
                        isLoading: false,
                        visiblepostIcon: true,
                        onTap: () async {
                          
                          form.currentState.save();
                          if (form.currentState.validate()) {
                            try {
                                await firestore
                                  .collection('education')
                                  .document()
                                  .setData({
                                "Extra Cirriculum 1": cocirrular,
                                "Extra Cirrcular 2": cocirrular,
                                "Name": name,
                                "Organisation": organisation,
                                "Designation": destignation,
                                //"Currentcity": Currentcity,

                              });
                              Navigator.pushNamed(context, HomePage.routeNamed);
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


