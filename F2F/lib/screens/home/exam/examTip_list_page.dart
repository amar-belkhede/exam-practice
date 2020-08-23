import 'package:F2F/models/webinar_detail_model.dart';
import 'package:F2F/models/webinar_model.dart';
import 'package:F2F/screens/home/webinar/Webinar_detail_page.dart';
import 'package:F2F/screens/home/exam/exam_detail_page.dart';
import 'package:F2F/services/api_service.dart';
import 'package:F2F/utils/colors.dart';
import 'package:flutter/material.dart';

class ExamTipListPage extends StatefulWidget {
  // final List<Webinar> webinarList;
  final list;
  final title;

  const ExamTipListPage({Key key, this.list, this.title}) : super(key: key);
  @override
  _ExamTipListPageState createState() => _ExamTipListPageState(list);
}

class _ExamTipListPageState extends State<ExamTipListPage> {
  final list;

  _ExamTipListPageState(this.list);

  @override
  Widget build(BuildContext context) {
    webinarTabs(var session) {
      return InkWell(
        onTap: () async {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => ExamDetailPage()));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[350],
                  offset: Offset(0.0, 4.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Image.asset(
                    session[0] ?? "assets/webinar/webinar_moving_student.png"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(
                          session[1],
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          session[2] + " " + session[3],
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
                            Text(" 4.4 (650)")
                          ],
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: LightColor.lightTeal,
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
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
                  for (var session in list) webinarTabs(session)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}