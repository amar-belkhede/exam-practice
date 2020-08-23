import 'package:F2F/screens/Otp/otp_page.dart';
import 'package:F2F/screens/login/login_page.dart';
import 'package:F2F/services/api_service.dart';
import 'package:F2F/utils/colors.dart';
import 'package:F2F/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool loading = false;
  bool checkBoxVal = false;

  TextEditingController mobileNoCont = new TextEditingController();
  TextEditingController passwordCont = new TextEditingController();
  TextEditingController firstNameCont = new TextEditingController();
  TextEditingController lastNameCont = new TextEditingController();
  String _mobileNo;
  String _password;
  String _firstName;
  String _lastName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Container(
              //   width: 300.0,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(20.0),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey[350],
              //         offset: Offset(0.0, 4.0),
              //         blurRadius: 10.0,
              //       ),
              //     ],
              //   ),
              //   padding: EdgeInsets.symmetric(horizontal: 15.0),
              //   child: TextFormField(
              //     controller: firstNameCont,
              //     decoration: InputDecoration(
              //         border: InputBorder.none, hintText: "First name"),
              //     validator: (value) {
              //       if (value.isNotEmpty) {
              //         setState(() {
              //           _firstName = value;
              //         });
              //       }
              //       return value.isEmpty ? 'First name cannot be empty.' : null;
              //     },
              //   ),
              // ),
              // SizedBox(
              //   height: 15.0,
              // ),
              // Container(
              //   width: 300.0,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(20.0),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey[350],
              //         offset: Offset(0.0, 4.0),
              //         blurRadius: 10.0,
              //       ),
              //     ],
              //   ),
              //   padding: EdgeInsets.symmetric(horizontal: 15.0),
              //   child: TextFormField(
              //     controller: lastNameCont,
              //     decoration: InputDecoration(
              //         border: InputBorder.none, hintText: "Last name"),
              //     validator: (value) {
              //       if (value.isNotEmpty) {
              //         setState(() {
              //           _lastName = value;
              //         });
              //       }
              //       return value.isEmpty ? 'Last name cannot be empty.' : null;
              //     },
              //   ),
              // ),
              // SizedBox(
              //   height: 15.0,
              // ),
              Container(
                width: 340.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[350],
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: mobileNoCont,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.stay_current_portrait,
                        color: LightColor.lightTeal,
                      ),
                      border: InputBorder.none,
                      hintText: 'Mobile No.'),
                  validator: (value) {
                    if (value.length == 10) {
                      setState(() {
                        _mobileNo = value;
                      });
                    }
                    return value.length != 10
                        ? 'Mobile No field must be exactly 10 digit'
                        : null;
                  },
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: 340.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[350],
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: passwordCont,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock_outline,
                        color: LightColor.lightTeal,
                      ),
                      border: InputBorder.none,
                      hintText: 'Password'),
                  validator: (value) {
                    if (value.length > 5) {
                      setState(() {
                        _password = value;
                      });
                    }
                    return value.length < 6
                        ? 'Password field must be at least 6 characters.'
                        : null;
                  },
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: 340.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[350],
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: passwordCont,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock_outline,
                        color: LightColor.lightTeal,
                      ),
                      border: InputBorder.none,
                      hintText: 'Confirm Password'),
                  validator: (value) {
                    if (value.length > 5) {
                      setState(() {
                        _password = value;
                      });
                    }
                    return value.length < 6
                        ? 'Password field must be at least 6 characters.'
                        : null;
                  },
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                width: 340.0,
                height: 50.0,
                // padding: EdgeInsets.all(20.0),
                child: FlatButton(
                  color: LightColor.lightTeal,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  // splashColor: Colors.grey[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        loading = true;
                      });
                      var result = await ApiService.getRegistration(
                          _firstName, _lastName, _mobileNo, _password);

                      if (result["flags"]["flag"] == 1) {
                        setState(() {
                          loading = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OtpPage(
                              mobileNo: result["flags"]["mobileNo"],
                              otp: result["flags"]["otp"].toString(),
                            ),
                          ),
                        );
                      } else {
                        setState(() {
                          loading = false;
                        });
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("Invalid Credentials"),
                          duration: Duration(seconds: 3),
                        ));
                      }
                    }
                  },
                  child: loading
                      ? loadingWidget
                      : Text(
                          "REGISTER",
                          style: TextStyle(fontSize: 18.0),
                        ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),

              CheckboxListTile(
                value: checkBoxVal,
                onChanged: (val) => checkBoxVal = val,
                title: Text(
                  "Agree To The Terms Of Service & Privacy Policy",
                  style: TextStyle(color: Colors.grey),
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              SizedBox(
                height: 30.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 17.0,
                        color: LightColor.lightTeal,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
