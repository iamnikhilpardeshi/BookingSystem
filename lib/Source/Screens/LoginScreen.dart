import 'package:VisitorsManagementSystem/Source/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final mobilenoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 1.0,
            color: Colors.white,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 0.75,
                    color: Colors.white,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        height: MediaQuery.of(context).size.height * 0.4,
                        color: Colors.white24,
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: new BoxDecoration(
                                image: new DecorationImage(
                                  image: new AssetImage(
                                      "assets/images/mgvlogo.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text("Visitors management system")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        // bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        // bottomLeft: Radius.circular(10.0),
                      ),
                      border: Border.all(
                        color: Colors.red[500],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Form(
                              key: _formkey,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
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
                                        return "Please Enter Mobile No..";
                                      }
                                      if (value.length < 10) {
                                        return "Please type correct Mobile No.";
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: RaisedButton(
                                      onPressed: () async {
                                        if (_formkey.currentState.validate()) {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          await prefs.setBool('login', true);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen(),
                                            ),
                                          );
                                        } else {
                                          print("error");
                                        }
                                      },
                                      splashColor: Colors.blue,
                                      child: Text("Login Here"),
                                    ),
                                  )
                                ],
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
          )
        ],
      ),
    );
  }
}
