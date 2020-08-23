import 'package:F2F/utils/colors.dart';
import 'package:flutter/material.dart';

class ExamDetailPage extends StatefulWidget {
  @override
  _ExamDetailPageState createState() => _ExamDetailPageState();
}

class _ExamDetailPageState extends State<ExamDetailPage> {
  detailTab() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset("assets/exam/mhcet_exam_details.png"),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Complex Number JEE Main 2020",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
          Text(
            "The MHT-CET or Common Entrance Test is an annual entrance exam conducted by the Government of Maharashtra. It is conducted by the Directorate of Technical Education.",
            style: TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.message,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              "Total Number Of Questions",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "50 From Each Subject",
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.message,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              "Total Marks",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "200",
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.message,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              "Total Hours",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "1:14:32",
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.message,
                            color: Colors.grey,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            width: 150,
                            child: Text(
                              "Marking Scheme",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "No Negative Marking",
                        style: TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  userReviewTab() {
    return Container(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Reviews",
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              children: <Widget>[for (int i = 0; i < 10; i++) userTab()],
            )
          ],
        ),
      ),
    );
  }

  userTab() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            "assets/drawable-xxhdpi/user2.png",
            width: 50,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width - 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Mona Green",
                style: TextStyle(fontSize: 20.0),
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
                  Text(" 4.4")
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "The MHT-CET or Common Entrance Test is an annual entrance exam conducted by the Government of Maharashtra. It is conducted by the Directorate of Technical Education.",
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(
            // isScrollable: true,
            labelColor: Colors.blue,
            indicatorColor: Colors.blue,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: Colors.blue),
              insets: EdgeInsets.symmetric(horizontal: 30.0),
            ),
            tabs: [
              Tab(text: "Details"),
              Tab(text: "User Reviews"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            detailTab(),
            userReviewTab(),
          ],
        ),
      ),
    );
  }
}
