import 'package:F2F/screens/Otp/otp_page.dart';
import 'package:F2F/services/api_service.dart';
import 'package:F2F/utils/colors.dart';
import 'package:flutter/material.dart';

class MobilenoPage extends StatefulWidget {
  @override
  _MobilenoPageState createState() => _MobilenoPageState();
}

class _MobilenoPageState extends State<MobilenoPage> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController mobileNo = new TextEditingController();

  String _mobileNo;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: LightColor.lightTeal,
          title: Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Form(
              key: _form,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 20.0, right: 16.0),
                    child: Text(
                      "Enter your phone number",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
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
                    height: 50.0,
                    child: RaisedButton(
                        onPressed: () async {
                          var errmsg =
                              'The mobileNo field must be exactly 10 characters ';

                          if (_form.currentState.validate()) {
                            Map resendOtpResult =
                                await ApiService.resendOtp(_mobileNo);

                            if (resendOtpResult["flags"]["flag"] == 2) {
                              errmsg = resendOtpResult["flags"]["emsg"];
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(errmsg),
                                duration: Duration(seconds: 3),
                              ));
                            } else if (resendOtpResult["flags"]["flag"] == 1) {
                              errmsg = resendOtpResult["flags"]["smsg"];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtpPage(
                                            mobileNo: mobileNo,
                                            otp: resendOtpResult["flags"]
                                                ["otp"],
                                          )));
                            }
                          } else {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text(errmsg),
                              duration: Duration(seconds: 3),
                            ));
                          }
                        },
                        child: Text("Get OTP"),
                        textColor: Colors.white,
                        color: LightColor.lightTeal,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ],
              ),
            )
          ],
        ));
    // TODO: implement build
  }
}
