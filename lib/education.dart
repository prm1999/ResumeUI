import 'package:Resume/custom_button.dart';
import 'package:Resume/custom_textfield.dart';
import 'package:Resume/global.dart';
import 'package:Resume/home.dart';
import 'package:flutter/material.dart';

class Education extends StatefulWidget {
  static const String routeNamed = 'resume';

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  _navigateToHomePage() {
    Navigator.pushNamed(context,HomePage.routeNamed);
  }
  String course;
  String branch;
  String university;
  String passing_year;
  String percentage;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          title: Container(
              child: Text('Education', style: TextStyle(color: Colors.black),)),
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
                                        ),
                              CustomTextField(
                                size: false,
                                hintText: 'branch',
                                onSaved: (value) {
                                  branch = value;
                                },
                              ),
                          CustomTextField(
                            size: false,
                            hintText: 'university',
                            onSaved: (value) {
                              university = value;
                            },
                          ),
                    CustomTextField(
                      size: false,
                      hintText: 'passing_year',
                      onSaved: (value) {
                        passing_year = value;
                      },
                    ),
                    CustomTextField(
                      size: false,
                      hintText: 'percentage',
                      onSaved: (value) {
                        percentage = value;
                      },
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
                        formKey.currentState.save();

                        if (formKey.currentState.validate()) {
                          try {
                           await firestore
                                .collection('resume')
                                .document()
                                .setData(
                        {
                              "course": course,
                              "branch": branch,
                              "university": university,
                              "passing_year": passing_year,
                              "percentage": percentage,
                              //"Currentcity": Currentcity,

                            });
                            Navigator.pushNamed(context, Education.routeNamed);
                          } catch (e) {
                            print("signup error");
                            print(e);
                          }
                        }
                      },
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}


