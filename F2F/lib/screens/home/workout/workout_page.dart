import 'package:F2F/models/workout_detail_model.dart';
import 'package:F2F/models/workout_model.dart';
import 'package:F2F/screens/home/workout/workout_detail_page.dart';
import 'package:F2F/services/api_service.dart';
import 'package:F2F/utils/colors.dart';
import 'package:flutter/material.dart';

class WorkoutListPage extends StatefulWidget {
  final List<Workout> workoutList;

  const WorkoutListPage({Key key, this.workoutList}) : super(key: key);
  @override
  _WorkoutListPageState createState() => _WorkoutListPageState(workoutList);
}

class _WorkoutListPageState extends State<WorkoutListPage> {
  final List<Workout> workoutList;
  // var workout_book = [
  //   [
  //     "assets/drawable-xxhdpi/hsc_english.png",
  //     "HSC English",
  //     "Mitch Weiss",
  //   ],
  //   [
  //     "assets/drawable-xxhdpi/physics_encyclopedia.png",
  //     "Physics Encyclopedia",
  //     "Antony Beevor",
  //   ],
  //   [
  //     "assets/drawable-xxhdpi/practice_book_physics_for_jee.png",
  //     "JEE Problems",
  //     "Christian Jennings",
  //   ],
  //   [
  //     "assets/drawable-xxhdpi/jeemain_chemistry.png",
  //     "JEE Main Chemistry",
  //     "Mitch Weiss",
  //   ],
  //   [
  //     "assets/drawable-xxhdpi/iit_jee_mathematics.png",
  //     "Mathematics",
  //     "Antony Beevor",
  //   ],
  // ];

  _WorkoutListPageState(this.workoutList);

  _workoutTile(Workout workout) {
    return InkWell(
      onTap: () async {
        WorkoutDetail workoutDetail =
            await ApiService.getWorkoutDetail(workout.workoutId);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WorkoutDetailPage(
                      workoutDetail: workoutDetail,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              workout.workoutBookImage ??
                  "assets/drawable-xxhdpi/iit_jee_mathematics.png",
              height: 175.0,
              width: 115,
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    workout.workoutBookName,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    workout.workoutAuthorName,
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Row(
                    children: <Widget>[
                      for (int i = 0; i < 5; i++)
                        Icon(
                          Icons.star,
                          color: LightColor.lightTeal,
                          size: 15.0,
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Rs " + workout.workoutBookDiscountPrice,
                    // "Rs 299 onwards",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 30.0,
                        child: FlatButton(
                          color: LightColor.lightTeal,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => InviteFriend()));
                          },
                          child: Text(
                            "Book",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 100.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[200],
                              offset: Offset(0.0, 4.0),
                              blurRadius: 10.0,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Details",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Workout",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: LightColor.lightTeal,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 40.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200],
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.search),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Search",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => InvitePage()));
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.filter_list,
                              // size: 15.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //end of search

            for (Workout workout in workoutList) _workoutTile(workout)

            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Image.asset(
            //         "assets/drawable-xxhdpi/physics_encyclopedia.png",
            //         height: 175.0,
            //         width: 115,
            //       ),
            //       SizedBox(width: 10.0),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           Padding(
            //             padding: const EdgeInsets.only(top: 15.0),
            //             child: Text(
            //               "HSC English",
            //               style: TextStyle(fontSize: 16.0),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(top: 5.0),
            //             child: Text(
            //               "Mitch Weiss",
            //               style: TextStyle(fontSize: 12.0, color: Colors.grey),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(top: 15.0),
            //             child: Row(
            //               children: <Widget>[
            //                 for (int i = 0; i < 5; i++)
            //                   Icon(
            //                     Icons.star,
            //                     color: LightColor.lightTeal,
            //                     size: 15.0,
            //                   ),
            //               ],
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(top: 10.0),
            //             child: Text(
            //               "Rs 299 onwards",
            //               style: TextStyle(fontSize: 12.0, color: Colors.grey),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(top: 20.0),
            //             child: Row(
            //               children: <Widget>[
            //                 Container(
            //                   width: 100.0,
            //                   height: 30.0,
            //                   child: FlatButton(
            //                     color: LightColor.lightTeal,
            //                     textColor: Colors.white,
            //                     disabledColor: Colors.grey,
            //                     disabledTextColor: Colors.black,
            //                     padding: EdgeInsets.all(8.0),
            //                     splashColor: Colors.teal,
            //                     shape: RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(5.0)),
            //                     onPressed: () {
            //                       // Navigator.pushReplacement(
            //                       //     context,
            //                       //     MaterialPageRoute(
            //                       //         builder: (context) => InviteFriend()));
            //                     },
            //                     child: Text(
            //                       "Book",
            //                       style: TextStyle(
            //                         fontFamily: "Montserrat",
            //                         fontSize: 12.0,
            //                         fontWeight: FontWeight.w700,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   width: 10.0,
            //                 ),
            //                 Container(
            //                   width: 100.0,
            //                   height: 30.0,
            //                   decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     borderRadius: BorderRadius.all(
            //                       Radius.circular(5.0),
            //                     ),
            //                     boxShadow: [
            //                       BoxShadow(
            //                         color: Colors.grey[200],
            //                         offset: Offset(0.0, 4.0),
            //                         blurRadius: 10.0,
            //                       )
            //                     ],
            //                   ),
            //                   child: Center(
            //                     child: Text(
            //                       "Details",
            //                       textAlign: TextAlign.center,
            //                       style: TextStyle(
            //                         fontFamily: "Montserrat",
            //                         fontSize: 12.0,

            //                         // fontWeight: FontWeight.w700,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           )
            //         ],
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
