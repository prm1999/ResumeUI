import 'package:Resume/education.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Resume/custom_textfield.dart';
import 'package:Resume/custom_button.dart';
import 'package:Resume/global.dart';

class SecondaryEdu extends StatefulWidget{
  static const String routeNamed = 'SedondaryEdu';
  @override
  _SeconadryEduState createState()=>_SeconadryEduState();

}
class _SeconadryEduState extends State<SecondaryEdu>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  _navigateToEducationPage() {
    Navigator.pushNamed(context,Education.routeNamed);
  }
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

            onPressed:_navigateToEducationPage ,
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



// TODO: implement build
   // throw UnimplementedError();
  }

}




