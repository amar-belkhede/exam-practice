import 'package:F2F/screens/profile/setting_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  _dataTabs(String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        width: 300.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[350],
              offset: Offset(0.0, 4.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        padding: EdgeInsets.all(15.0),
        child: Text(
          value,
          style: TextStyle(color: Colors.grey, fontSize: 14.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    "assets/drawable-xxhdpi/profile_background.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Profile",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24.0),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SettingPage()));
                                },
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/drawable-xxhdpi/user.png",
                          height: 170,
                          // width: 110,
                        ),
                        Text(
                          "Monica Sharma",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
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
                        //   padding: EdgeInsets.all(15.0),
                        //   child: Text(
                        //     "Monica Sharma",
                        //     style: TextStyle(color: Colors.grey, fontSize: 14.0),
                        //   ),
                        // ),
                        _dataTabs("Monica Sharma"),
                        _dataTabs("monicasharma@gmail.com"),
                        _dataTabs("91+8798675433"),
                        _dataTabs("DOB 09-03-1998"),
                        _dataTabs("Female"),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
