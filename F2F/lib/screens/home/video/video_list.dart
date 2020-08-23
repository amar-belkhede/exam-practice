import 'package:F2F/models/video_detail_model.dart';
import 'package:F2F/models/video_model.dart';
import 'package:F2F/screens/home/video/video_detail_page.dart';
import 'package:F2F/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:F2F/utils/colors.dart';

class VideoList extends StatefulWidget {
  final List<Video> videoList;
  final list;
  final title;

  const VideoList({Key key, this.videoList, this.list, this.title})
      : super(key: key);

  @override
  _VideoListState createState() => _VideoListState(videoList, list);
}

class _VideoListState extends State<VideoList> {
  final List<Video> videoList;
  final list;

  _VideoListState(this.videoList, this.list);

  inspiringVideoTab(Video video) {
    return InkWell(
      onTap: () async {
        VideoDetail videoDetail = await ApiService.getVideoDetail(video.ivId);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoDetailPage(
              videoDetails: videoDetail,
              title: "Useful videos",
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  offset: Offset(0.0, 4.0),
                  blurRadius: 10.0,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      // video.ivThumb ??
                      "assets/inspiring_video/video_jeemain_3.png",
                      height: 100,
                      width: 150,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 210,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            video.ivTitle,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Paperback-1",
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
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
                                    // "Author: " +
                                    video.firstName + " " + video.lastName,
                                    style: TextStyle(
                                        fontSize: 12.0, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 60.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  color: Colors.red[800],
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
                                    "Watch",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
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
          widget.title,
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

            Column(
              children: <Widget>[
                for (Video video in videoList) inspiringVideoTab(video)
              ],
            )
          ],
        ),
      ),
    );
  }
}
