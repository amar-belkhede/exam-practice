import 'package:F2F/models/webinar_detail_model.dart';
import 'package:F2F/utils/colors.dart';
import 'package:flutter/material.dart';

class WebinarDetailPage extends StatefulWidget {
  final WebinarDetail webinarDetails;
  final title;

  const WebinarDetailPage({Key key, this.webinarDetails, this.title})
      : super(key: key);

  @override
  _WebinarDetailPageState createState() =>
      _WebinarDetailPageState(webinarDetails, title);
}

class _WebinarDetailPageState extends State<WebinarDetailPage> {
  final WebinarDetail webinarDetails;
  final title;

  _WebinarDetailPageState(this.webinarDetails, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            // width: double.infinity,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 70,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Image.asset(
                      webinarDetails.webinarImage ??
                          "assets/webinar/webinar_complex_number_video.png",
                      width: MediaQuery.of(context).size.width),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          webinarDetails.webinarFromTime,
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          webinarDetails.webinarTitle,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          webinarDetails.webinarShortDetail,
                          style: TextStyle(
                              color: LightColor.lightTeal, fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            for (int i = 0; i < 5; i++)
                              Icon(
                                Icons.star,
                                color: LightColor.lightTeal,
                                size: 20.0,
                              ),
                            Text(" 4.4 (650)")
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        if (title == "Exam Tips")
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "About:",
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Joint Entrance Examination – Main, formerly All India Engineering Entrance Examination, is an examination organised by the National Testing Agency in India.",
                                style: TextStyle(fontSize: 14.0),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.hourglass_empty,
                                      color: Colors.grey),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "1 h 33 min Session",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.assignment, color: Colors.grey),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "English, Hindi",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        if (title == "Webinar")
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "This Webinar Include:",
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.assignment, color: Colors.grey),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 90,
                                    child: Text(
                                      "Introduction to complex number, Equality conjugate, Addition and Subtraction.",
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.hourglass_empty,
                                      color: Colors.grey),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Total 2 hours",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.stay_current_portrait,
                                      color: Colors.grey),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Access on Mobile, laptop and TV",
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 30,
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Center(
                        child: Text(
                      "Rs " + webinarDetails.webinarDiscountPrice,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Flexible(
                  flex: 70,
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    color: LightColor.lightTeal,
                    child: Center(
                        child: Text(
                      "Buy Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      // ),
    );
  }
}
