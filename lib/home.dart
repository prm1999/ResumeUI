import 'package:Resume/custom_button.dart';
import 'package:Resume/custom_textfield.dart';
import 'package:Resume/education.dart';
import 'package:Resume/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

import 'dart:core';

class HomePage extends StatefulWidget {
  static const String routeNamed = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  String firstName;
  String lastName;
  String gmail;
  String phoneNo;
  String qualification;
  String Currentcity;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
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
                        hintText: 'First Name',
                        onSaved: (value) {
                          firstName = value;
                        },
                        validator: requiredString,
                      ),
                      CustomTextField(
                        size: false,
                        hintText: 'Last Name',
                        onSaved: (value) {
                          lastName = value;
                        },
                        validator: requiredString,
                      ),
                      CustomTextField(
                        size: false,
                        hintText: 'Gmail',
                        onSaved: (value) {
                          gmail = value;
                        },
                        validator: validateEmail,
                      ),
                      CustomTextField(
                          size: false,
                          hintText: 'Phone Number',
                          onSaved: (value) {
                            phoneNo = value;
                          },
                          validator: validatePhone),
                      CustomTextField(
                          size: false,
                          hintText: 'Qualification',
                          onSaved: (value) {
                            qualification = value;
                          },
                          validator: requiredString),
                   CustomTextField(
                      size: false,
                      hintText: 'CurrentCity',
                      onSaved: (value) {
                        Currentcity = value;
                      },
                      validator: requiredString),
                              SizedBox(
                        height: 16,
                      ),
                      CustomButton(
                        labelText: ' Save And Next',
                        isLoading: false,
                        postIcon: Icons.arrow_forward,
                        visiblepostIcon: true,
                        onTap: () async {
                          formKey.currentState.save();

                          if (formKey.currentState.validate()) {
                            try {
                              await firestore
                                  .collection('resume')
                                  .document()
                                  .setData({
                                "firstName": firstName,
                                "lastName": lastName,
                                "gmail": gmail,
                                "phoneNo": phoneNo,
                                "qualification": qualification,
                                "Currentcity": Currentcity,

                              });
                              Navigator.pushNamed(context, Education.routeNamed);
                            } catch (e) {
                              print("signup error");
                              print(e);
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
