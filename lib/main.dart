import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';

void main()=>runApp(MyApp());
//async {
 // WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
//}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'Personal Information',
          theme:ThemeData(primaryColor: Colors.blueAccent,
          ),
      home:HomeScreen(title:'Resume'),

    );
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}):super(key: key);
  final String title;

  @override
  HomeScreenState createState()=>HomeScreenState();
  }

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: ResumeApi(),
    );
  }
}


class ResumeApi extends StatefulWidget {
  ResumeApi({Key key}):super(key: key);

  @override
  ResumeApiState createState()=>ResumeApiState();
}


class ResumeApiState extends State<ResumeApi>{
  final _formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final qualificationController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference().child("FirstName");



  @override
  Widget build (BuildContext context){
    return Form(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget>[

              // Add TextFormFields and ElevatedButton here.
                TextFormField (
                  controller: firstnameController,
                  maxLines: 1,
                  minLines: 1,
                  keyboardType: TextInputType.text,
                  decoration:const InputDecoration(
                    contentPadding: EdgeInsets.only(left :10.0,top:10.0,bottom: 5.0,right: 10.0),
                    //border: InputBorder.none,
                  icon: const Icon(Icons.person),
                    labelText: 'First Name',
                  ),
                  validator: (value){
                    if (value.isEmpty){
                  return 'Enter First Name';
              }
                    return null;
                  }
                ),

              TextFormField(
                controller: lastnameController,
                keyboardType: TextInputType.text,
                decoration:const InputDecoration(
                  contentPadding: EdgeInsets.only(left :5.0,top:5.0,bottom: 5.0,right: 5.0),
                  icon: const Icon(Icons.person),
                  labelText: 'Last Name',
                ),
              ),
              TextFormField (
                controller: emailController,
                keyboardType:TextInputType.emailAddress ,
                decoration:const InputDecoration(
                  contentPadding: EdgeInsets.only(left :2.0,top:5.0,bottom: 5.0),
                  icon: const Icon(Icons.email),
                  labelText: 'Email Id',
                ),
              ),
              TextFormField(
                controller: qualificationController,
                keyboardType: TextInputType.text,
                decoration:const InputDecoration(
                  contentPadding: EdgeInsets.only(left :2.0,top:5.0,bottom: 5.0),
                  icon: const Icon(Icons.book),
                  labelText: 'Highest Qualification',
                ),
              ),
              TextFormField (
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration:const InputDecoration(
                  contentPadding: EdgeInsets.only(left :2.0,top:5.0,bottom: 5.0),
                  icon: const Icon(Icons.phone),
                  labelText: 'Contact No',
                ),
              ),
              TextFormField(
                controller: addressController,
                keyboardType: TextInputType.text,
                decoration:const InputDecoration(
                  icon: const Icon(Icons.add_location),
                  contentPadding: EdgeInsets.only(left :2.0,top:5.0,bottom: 5.0),
                  labelText: 'Address',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                        dbRef.push().set({
                        "firstname": firstnameController.text,
                         "lastname":lastnameController.text,
                         "email":emailController.text,
                         "qualification":qualificationController.text ,
                         "phone":phoneController.text,
                         "address":addressController .text,
                      }).then((_) {
                          // ignore: deprecated_member_use
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Successfully Added')));

                        firstnameController.clear();
                          lastnameController.clear();
                          emailController.clear();
                          qualificationController.clear();
                          phoneController.clear();
                          addressController.clear();
                      }).catchError((onError) {
                            // ignore: deprecated_member_use
                          Scaffold.of(context)
                              // ignore: deprecated_member_use
                              .showSnackBar(SnackBar(content: Text(onError)));

                        });

                    }

                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                 // Navigator.push(
                   // context,
                   // MaterialPageRoute(builder: (context)=>Education())
                  //)
                  },
                  child: Text('Save And Next'),
                ),
              ),
            ]
        )
    );
  }
  @override
  void dispose(){
    super.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    qualificationController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }
}




