import 'package:F2F/helpers/helper_functions.dart';
import 'package:F2F/screens/Otp/mobileNo_page.dart';
import 'package:F2F/screens/navigation_page.dart';
import 'package:F2F/screens/signup/signup_page.dart';
import 'package:F2F/services/api_service.dart';
import 'package:F2F/utils/colors.dart';
import 'package:F2F/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController mobileNo = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String _mobileNo;
  String _password;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                  controller: mobileNo,
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
                        ? 'The mobileNo field must be exactly 10 characters in length'
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
                  controller: password,
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
                        ? 'The Password field must be at least 6 characters in length.'
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
                // padding: EdgeInsets.all(5.0),
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
                    var result;
                    if (_formKey.currentState.validate()) {
                      print("mobile: ");
                      print(_mobileNo);
                      print("password: ");
                      print(_password);
                      setState(() {
                        loading = true;
                      });

                      result = await ApiService.getLogin(_mobileNo, _password);

                      if (result["flags"]["flag"] == 1) {
                        await HelperFunctions.saveAuthTokenSharedPreference(
                            result["authToken"]["authToken"]);
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => NavigationPage()));
                      } else {
                        setState(() {
                          loading = false;
                        });
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("Invalid Credentials"),
                          duration: Duration(seconds: 3),
                        ));
                      }

                      print("token");
                      String token =
                          await HelperFunctions.getAuthTokenSharedPreference();
                      print(token);
                    }
                  },
                  child: loading
                      ? loadingWidget
                      : Text(
                          "Login",
                          style: TextStyle(fontSize: 18.0),
                        ),
                ),
              ),
              // Container(
              //   width: 340.0,
              //   height: 70.0,
              //   padding: EdgeInsets.only(
              //       left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
              //   child: OutlineButton(
              //     textColor: Colors.black,
              //     // disabledColor: Colors.grey,
              //     disabledTextColor: Colors.black45,
              //     padding: EdgeInsets.all(8.0),
              //     // splashColor: Colors.grey[400],
              //     color: Colors.black,
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(
              //         width: 4,
              //         style: BorderStyle.solid,
              //       ),
              //       borderRadius: BorderRadius.circular(20),
              //     ),

              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => SignupPage()));
              //     },
              //     child: Text(
              //       "Sign up",
              //       style: TextStyle(fontSize: 16.0),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MobilenoPage()));
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.grey
                      // decoration: TextDecoration.underline,
                      ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                "assets/logo/Login_logos.png",
                width: 160,
              ),
              SizedBox(
                height: 40.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have account? ",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "Register",
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
