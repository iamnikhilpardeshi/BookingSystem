import 'dart:io';

import 'package:VisitorsManagementSystem/Source/Screens/LoginScreen.dart';
import 'package:VisitorsManagementSystem/firebase/auth/phone_auth/get_phone.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formkey = GlobalKey<FormState>();
  final mobilenoController = TextEditingController();
  final fullnameController = TextEditingController();
  final addressController = TextEditingController();
  final reasonController = TextEditingController();
  int _value = 1;
  String _myActivity;
  String _myActivityResult;

  var _userImage;

  _pickImageFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _userImage = image.path;
      print(_userImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff03dac6),
        // backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.black,
        onPressed: () {
          // Respond to button press
        },
        // icon: Icon(Icons.add),
        label: Text('Book Your Appointment'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          "HomeScreen",
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black54,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Exit"),
                  content: Text("Do you want to logout..."),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("No"),
                    ),
                    FlatButton(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool('login', false);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhoneAuthGetPhone(),
                          ),
                        );
                      },
                      child: Text("Yes"),
                    )
                  ],
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              // color: Colors.green[50],
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.38,
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                  ),
                                  border: Border.all(
                                    color: Colors.red[500],
                                  ),
                                  image: new DecorationImage(
                                    image: _userImage == null
                                        ? AssetImage("")
                                        : FileImage(
                                            File(_userImage),
                                          ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10.0,
                                right: 10.0,
                                child: InkWell(
                                    onTap: () {
                                      _pickImageFromCamera();
                                    },
                                    child: Icon(Icons.camera_alt,
                                        color: Colors.teal, size: 20.0)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: _formkey,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Mobile Number',
                                          isDense: true,
                                          focusColor: Colors.blue[50],
                                        ),
                                        autofocus: false,
                                        controller: mobilenoController,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Please Enter Full name..";
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Full Name',
                                          isDense: true,
                                          focusColor: Colors.blue[50],
                                        ),
                                        autofocus: false,
                                        controller: fullnameController,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Please Enter City..";
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Address',
                                          isDense: true,
                                          focusColor: Colors.blue[50],
                                        ),
                                        autofocus: false,
                                        controller: addressController,
                                        minLines: 1,
                                        maxLines: 5,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Please Enter Address..";
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Reason',
                                          isDense: true,
                                          focusColor: Colors.blue[50],
                                        ),
                                        autofocus: false,
                                        controller: reasonController,
                                        minLines: 1,
                                        maxLines: 5,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Please Enter Reason..";
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: DropDownFormField(
                                          titleText: 'Whom you want to meet',
                                          hintText: 'Please choose one',
                                          value: _myActivity,
                                          onSaved: (value) {
                                            setState(() {
                                              _myActivity = value;
                                              print(_myActivity);
                                            });
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              _myActivity = value;
                                              print(_myActivity);
                                            });
                                          },
                                          dataSource: [
                                            {
                                              "display": "Running",
                                              "value": "Running",
                                            },
                                            {
                                              "display": "Climbing",
                                              "value": "Climbing",
                                            },
                                            {
                                              "display": "Walking",
                                              "value": "Walking",
                                            },
                                            {
                                              "display": "Swimming",
                                              "value": "Swimming",
                                            },
                                            {
                                              "display": "Soccer Practice",
                                              "value": "Soccer Practice",
                                            },
                                            {
                                              "display": "Baseball Practice",
                                              "value": "Baseball Practice",
                                            },
                                            {
                                              "display": "Football Practice",
                                              "value": "Football Practice",
                                            },
                                          ],
                                          textField: 'display',
                                          valueField: 'value',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
