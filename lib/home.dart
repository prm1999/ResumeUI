import 'package:Resume/custom_button.dart';
import 'package:Resume/custom_textfield.dart';
import 'package:Resume/global.dart';
import 'package:Resume/resume.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  static const String routeNamed = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _navigateToResume() {
    Navigator.pushNamed(context,Resume.routeNamed);
  }

  final GlobalKey<FormState> formKey  = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Form(
            key: formKey,
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
                                BoxShadow(
                                    color:
                                        Colors.grey,
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
                      hintText: 'name',
                  
                    ),



                    CustomTextField(
                      size: false,
                      hintText: 'address',
                      
                   
                    ),


                       CustomTextField(
                      size: false,
                      hintText: 'address',
                      
                   
                    ),



                   CustomTextField(
                      size: false,
                      hintText: 'address',
                    
                      ),


                       CustomTextField(
                      size: false,
                      hintText: 'address',
                      
                   
                    ),


   CustomTextField(
                      size: false,
                      hintText: 'address',
                      
                   
                    ),


              SizedBox(
              height: 16,
                ),


                    
                     
                       CustomButton(
                          labelText: 'Next',
                          isLoading:false,
                          postIcon: Icons.arrow_forward,
                          visiblepostIcon: true,
                          onTap: _navigateToResume,
                         
                        )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}


