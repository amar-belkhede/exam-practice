import 'package:F2F/models/workout_detail_model.dart';
import 'package:F2F/screens/home/workout/comprehension_page.dart';
import 'package:F2F/utils/colors.dart';
import 'package:flutter/material.dart';

class WorkoutDetailPage extends StatefulWidget {
  final WorkoutDetail workoutDetail;

  const WorkoutDetailPage({Key key, this.workoutDetail}) : super(key: key);
  @override
  _WorkoutDetailPageState createState() =>
      _WorkoutDetailPageState(workoutDetail);
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  final WorkoutDetail workoutDetail;

  _WorkoutDetailPageState(this.workoutDetail);

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          actions: <Widget>[
            FlatButton(
              child: Container(
                child: Image.asset(
                    "assets/drawable-xxhdpi/start_your_workout.png"),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComprehensionPage(),
                    ));
              },
            ),
          ],
        );
      },
    );
  }

  _detailTab() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.library_books,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.vertical,
            //   child:
            Container(
              width: MediaQuery.of(context).size.width - 120,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Text(
                      "NOV 26, 2019",
                      style: TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                  ),
                  Text(
                    "Total Chapters Included",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "Reading Comprehension test from chapters can help you to improve  vocabulary",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                  // Text(
                  //   "can help you to improve  vocabulary",
                  //   style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "View Chapter",
                          style: TextStyle(color: Colors.blue, fontSize: 14.0),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Text(
                          "1:14:32",
                          style: TextStyle(color: Colors.grey, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Icon(
            Icons.add,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 94,
              // width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios)),
                          Container(
                            width: MediaQuery.of(context).size.width - 88,
                            child: Center(
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10.0,
                                        offset: Offset(0, 0.4),
                                      )
                                    ]),
                                    child: Image.asset(
                                      workoutDetail.workoutBookImage ??
                                          "assets/drawable-xxhdpi/hsc_english_square.png",
                                      height: 175.0,
                                      width: 175.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      workoutDetail.workoutBookName,
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text("Author: " +
                                        workoutDetail.workoutAuthorName),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        for (int i = 0; i < 4; i++)
                                          Icon(
                                            Icons.star,
                                            color: Colors.redAccent,
                                            size: 20.0,
                                          ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                          size: 20.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                        workoutDetail.workoutBookShortDetail),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Container(
                                      width: 140.0,
                                      height: 40.0,
                                      child: FlatButton(
                                        color: LightColor.lightTeal,
                                        textColor: Colors.white,
                                        disabledColor: Colors.grey,
                                        disabledTextColor: Colors.black,
                                        padding: EdgeInsets.all(8.0),
                                        splashColor: Colors.teal,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        onPressed: () {
                                          // Navigator.pushReplacement(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) => InviteFriend()));
                                        },
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.bookmark_border,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                "Add Favorite",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        "Details",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      _detailTab(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _detailTab(),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _showMyDialog();
              },
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
                        "Rs 150",
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
      ),
    );
  }
}
