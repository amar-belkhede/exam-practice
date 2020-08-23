import 'package:F2F/models/blog_detail_model.dart';
import 'package:F2F/models/video_detail_model.dart';
import 'package:F2F/utils/colors.dart';
import 'package:flutter/material.dart';

class VideoDetailPage extends StatefulWidget {
  final VideoDetail videoDetails;
  final title;

  const VideoDetailPage({Key key, this.videoDetails, this.title})
      : super(key: key);

  @override
  _VideoDetailPageState createState() =>
      _VideoDetailPageState(videoDetails, title);
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  final VideoDetail videoDetails;
  final title;

  _VideoDetailPageState(this.videoDetails, this.title);

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
                      // videoDetails.ivThumb ??
                      "assets/drawable-xxhdpi/inspiring_video.png",
                      // height: 200,
                      width: MediaQuery.of(context).size.width),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          videoDetails.ivCreatedDT,
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          videoDetails.ivTitle,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          videoDetails.ivDesc,
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
                        // if (title == "Exam Tips")
                        //   Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Text(
                        //         "About:",
                        //         style: TextStyle(fontSize: 16.0),
                        //       ),
                        //       SizedBox(
                        //         height: 10.0,
                        //       ),
                        //       Text(
                        //         "Joint Entrance Examination – Main, formerly All India Engineering Entrance Examination, is an examination organised by the National Testing Agency in India.",
                        //         style: TextStyle(fontSize: 14.0),
                        //       ),
                        //       SizedBox(
                        //         height: 10.0,
                        //       ),
                        //       Row(
                        //         children: <Widget>[
                        //           Icon(Icons.hourglass_empty,
                        //               color: Colors.grey),
                        //           SizedBox(
                        //             width: 10.0,
                        //           ),
                        //           Text(
                        //             "1 h 33 min Session",
                        //             style: TextStyle(fontSize: 14.0),
                        //           ),
                        //         ],
                        //       ),
                        //       SizedBox(
                        //         height: 10.0,
                        //       ),
                        //       Row(
                        //         children: <Widget>[
                        //           Icon(Icons.assignment, color: Colors.grey),
                        //           SizedBox(
                        //             width: 10.0,
                        //           ),
                        //           Text(
                        //             "English, Hindi",
                        //             style: TextStyle(fontSize: 14.0),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // if (title == "Webinar")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "This Video Include:",
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
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Text(
                                    videoDetails.ivTitle,
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
                                Icon(Icons.hourglass_empty, color: Colors.grey),
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
          // InkWell(
          //   onTap: () {},
          //   child: Row(
          //     children: <Widget>[
          //       Flexible(
          //         flex: 30,
          //         child: Container(
          //           height: 70,
          //           width: double.infinity,
          //           color: Colors.grey[200],
          //           child: Center(
          //               child: Text(
          //             "Rs " + blogDetails,
          //             style: TextStyle(
          //                 fontSize: 20.0, fontWeight: FontWeight.bold),
          //           )),
          //         ),
          //       ),
          //       Flexible(
          //         flex: 70,
          //         child: Container(
          //           height: 70,
          //           width: double.infinity,
          //           color: LightColor.lightTeal,
          //           child: Center(
          //               child: Text(
          //             "Buy Now",
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 24.0,
          //                 fontWeight: FontWeight.bold),
          //           )),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
      // ),
    );
  }
}
