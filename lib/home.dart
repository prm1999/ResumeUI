import 'package:Resume/custom_button.dart';
import 'package:Resume/custom_textfield.dart';
import 'package:Resume/careerobjandacademic.dart';
import 'package:Resume/global.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class HomePage extends StatefulWidget {
  static const String routeNamed = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  String Name;
  String gmail;
  String phoneNo;
  String status;
  String currentcity;
  String State;


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
                        hintText: ' Full  Name',
                        onSaved: (value) {
                          Name = value;
                        },
                        validator: requiredString,
                      ),
                      CustomTextField(
                        size: false,
                        hintText: 'Email Id',
                        onSaved: (value) {
                          gmail = value;
                        },
                        validator: validateEmail,
                      ),
                      CustomTextField(
                        size: false,
                        hintText: 'Phone number',
                        onSaved: (value) {
                          phoneNo = value;
                        },
                        validator:validatePhone ,
                      ),
                      CustomTextField(
                          size: false,
                          hintText: 'Status',
                          onSaved: (value) {
                            status = value;
                          },
                          validator:requiredString ),
                      CustomTextField(
                          size: false,
                          hintText: 'Currentcity',
                          onSaved: (value) {
                            currentcity= value;
                          },
                          validator: requiredString),
                   CustomTextField(
                      size: false,
                      hintText: 'State',
                      onSaved: (value) {
                        State= value;
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
                                "firstName": Name,
                                "lastName":gmail ,
                                "gmail": phoneNo,
                                "phoneNo": status,
                                "qualification": currentcity,
                                "Currentcity":State ,

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
