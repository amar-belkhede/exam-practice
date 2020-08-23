import 'package:F2F/helpers/helper_functions.dart';
import 'package:F2F/screens/login/login_page.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    settingOptions(name) {
      return Container(
        color: Colors.white,
        height: 70.0,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // SizedBox(
            //   width: 30.0,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                name,
                style: TextStyle(fontSize: 18.0, color: Colors.black54),
              ),
            ),
            IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black38),
                onPressed: null)
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
          elevation: 0,
          backgroundColor: Colors.grey[100],
          title: Text(
            "Setting",
            style:
                TextStyle(color: Colors.black54, fontStyle: FontStyle.normal),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              settingOptions("Edit Profile"),
              SizedBox(
                height: 30.0,
              ),
              settingOptions("Clear cache"),
              SizedBox(
                height: 30.0,
              ),
              settingOptions("Share the app"),
              settingOptions("Question"),
              settingOptions("About"),
            ],
          ),
          Container(
            width: double.infinity,
            height: 90.0,
            padding: EdgeInsets.all(20.0),
            child: FlatButton(
              color: Colors.grey[350],
              textColor: Colors.black45,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.grey[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () async {
                HelperFunctions.clearSharedPreference();
                Navigator.pushNamedAndRemoveUntil(
                    context, "/login", (r) => false);
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "Signout",
                style: TextStyle(
                  // fontFamily: "Montserrat",
                  fontSize: 14.0,
                  // fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
