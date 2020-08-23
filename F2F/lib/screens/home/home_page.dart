import 'package:F2F/models/blog_detail_model.dart';
import 'package:F2F/models/blog_model.dart';
import 'package:F2F/models/video_detail_model.dart';
import 'package:F2F/models/video_model.dart';
import 'package:F2F/models/webinar_detail_model.dart';
import 'package:F2F/models/webinar_model.dart';
import 'package:F2F/models/workout_detail_model.dart';
import 'package:F2F/models/workout_model.dart';
import 'package:F2F/screens/home/webinar/Webinar_detail_page.dart';
import 'package:F2F/screens/home/blog/blog_detail_page.dart';
import 'package:F2F/screens/home/cart/cart_page.dart';
import 'package:F2F/screens/home/exam/examTip_list_page.dart';
import 'package:F2F/screens/home/video/video_detail_page.dart';
import 'package:F2F/screens/home/video/video_list.dart';
import 'package:F2F/screens/home/exam/exam_detail_page.dart';
import 'package:F2F/screens/home/invite/invite_page.dart';
import 'package:F2F/screens/home/webinar/webinar_list_page.dart';
import 'package:F2F/screens/home/workout/workout_detail_page.dart';
import 'package:F2F/screens/home/workout/workout_page.dart';
import 'package:F2F/screens/home/blog/blog_list.dart';
import 'package:F2F/services/api_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var exam_logo = [
    ["BITSAT", "assets/drawable-xxhdpi/BITS.png"],
    ["HSC", "assets/drawable-xxhdpi/hsc_logo.png"],
    ["JEE Main", "assets/drawable-xxhdpi/jee_main_logo.png"],
    ["MH-CET", "assets/drawable-xxhdpi/mhcet.png"],
    ["WBJEE", "assets/drawable-xxhdpi/wbjee_logo.png"],
  ];

  var workout_book = [
    "assets/drawable-xxhdpi/jee_main_physics.png",
    "assets/drawable-xxhdpi/physics_encyclopedia.png",
    "assets/drawable-xxhdpi/jeemain_chemistry.png",
  ];

  var exam_tips = [
    [
      "JEE Main Tips",
      "by Christopher Wilson",
      "assets/drawable-xxhdpi/jeemain_tips.png"
    ],
    [
      "Exam tips",
      "by Rebecca Mackenzie",
      "assets/drawable-xxhdpi/exam_tips.png"
    ],
    [
      "JEE Main",
      "by Sarah J. Noughton",
      "assets/drawable-xxhdpi/jeemain_prep.png"
    ]
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var webinarSessions = [
    [
      "assets/webinar/webinar_moving_student.png",
      "IIT Preparation for session 2020-21 form home",
      "webinar"
    ],
    [
      "assets/webinar/webinar_career_counseling.png",
      "Career Counseling Webinar",
      "webinar"
    ],
    [
      "assets/webinar/webinar_complex_number.png",
      "Complex Maths JEE Main 2020",
      "webinar"
    ],
    [
      "assets/webinar/webinar_session.png",
      "Question/Answer session with PTE-A Expert",
      "webinar"
    ],
  ];

  var webinarDetail = [
    "assets/webinar/webinar_complex_number_video.png",
    "NOV 26, 2019",
    "Complex Number JEE Main 2020",
    "You will revise everything you need to know before giving an exam",
    "webinar"
  ];

  var examTipDetail = [
    "assets/webinar/webinar_complex_number_video.png",
    "",
    "JEE (Main + Advanced) Session 2020-21",
    "",
    "examtip"
  ];

  var videoList = [
    ["assets/inspiring_video/video_jeemain_1.png", "JEE Main", "video"],
    ["assets/inspiring_video/video_jeemain_2.png", "JEE Main", "video"],
    ["assets/inspiring_video/video_jeemain_3.png", "JEE Main", "video"],
    ["assets/inspiring_video/video_mhcet_1.png", "MHT-CET", "video"],
    ["assets/inspiring_video/video_mhcet_2.png", "MHT-CET", "video"],
    ["assets/inspiring_video/video_mhcet_3.png", "MHT-CET", "video"],
  ];

  var usefulBlogList = [
    ["assets/useful_blog/usefulBlog_1.png", "JEE Main blog", "blog"],
    ["assets/useful_blog/usefulBlog_2.png", "JEE Main blog", "blog"],
    ["assets/useful_blog/usefulBlog_3.png", "JEE Main blog", "blog"],
  ];

  var examTipList = [
    [
      "assets/exam_tips/examtips_1.png",
      "JEE Main Exam Tips",
      "Amar",
      "Belkhede",
      "tips",
    ],
    [
      "assets/exam_tips/examtips_2.png",
      "JEE Main Exam Tips",
      "Amar",
      "Belkhede",
      "tips",
    ],
    [
      "assets/exam_tips/examtips_3.png",
      "JEE Main Exam Tips",
      "Amar",
      "Belkhede",
      "tips",
    ],
  ];

  var jeemainExam = [
    ["assets/exam/jeemain_exam_list.png", "JEE Main 2019 Set A"],
    ["assets/exam/jeemain_exam_list.png", "JEE Main 2019 Set B"],
    ["assets/exam/jeemain_exam_list.png", "JEE Main 2019 Set C"],
    ["assets/exam/jeemain_exam_list.png", "JEE Main 2019 Set D"],
  ];

  Widget _viewAll = Padding(
    padding: const EdgeInsets.only(
      right: 20.0,
      top: 20.0,
    ),
    child: Row(
      children: <Widget>[
        Text(
          "View all",
          style: TextStyle(fontSize: 14.0, color: Colors.grey),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 10,
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: <Widget>[
              CustomPaint(
                size: MediaQuery.of(context).size,
                painter: CurvePainter(),
              ),
              CustomPaint(
                size: MediaQuery.of(context).size,
                painter: LightCurvePainter(),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 10.0, top: 20.0, bottom: 20.0),
                          child: Container(
                            height: 40.0,
                            width: MediaQuery.of(context).size.width - 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.search),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "Search",
                                        style: TextStyle(
                                            fontSize: 16.0, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InvitePage()));
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.add,
                                          size: 15.0,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "Invite",
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () async {
                              List<Workout> workoutList =
                                  await ApiService.getAllWorkout("1");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartPage(
                                            workoutList: workoutList,
                                          )));
                            })
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                      child: Text(
                        "Our Top Picks",
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          Image.asset(
                            "assets/drawable-xxhdpi/book_list.png",
                            height: 150.0,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.49,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        top: 30.0,
                      ),
                      child: Text(
                        "Book an Exam",
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: <Widget>[
                        for (int i = 0; i < exam_logo.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, bottom: 20.0, top: 20.0),
                            child: Column(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    var session = [];
                                    // if (exam_logo[i][1] == "JEE Main") {
                                    //   print("going to jee main");
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           // ExamDetailPage()
                                    //           WebinarPage(
                                    //         webSes: session,
                                    //       ),
                                    //     ),
                                    //   );
                                    // }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ExamDetailPage(),
                                      ),
                                    );
                                  },
                                  child: Image.asset(
                                    exam_logo[i][1],
                                    height: 60.0,
                                    width: 60.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  exam_logo[i][0],
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ]),
                    ),

                    //end of exam

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 20.0,
                          ),
                          child: Text(
                            "Book a Workout",
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.black),
                          ),
                        ),
                        InkWell(
                            onTap: () async {
                              List<Workout> workoutList =
                                  await ApiService.getAllWorkout("1");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WorkoutListPage(
                                            workoutList: workoutList,
                                          )));
                            },
                            child: _viewAll),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            for (var img in workout_book)
                              InkWell(
                                onTap: () async {
                                  WorkoutDetail workoutDetail =
                                      await ApiService.getWorkoutDetail("1");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WorkoutDetailPage(
                                                workoutDetail: workoutDetail,
                                              )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                    left: 20.0,
                                  ),
                                  child: Image.asset(
                                    img,
                                    height: 170.0,
                                    width: 105.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    //end of workout

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 30.0,
                          ),
                          child: Text(
                            "Book a Webinar",
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.black),
                          ),
                        ),
                        InkWell(
                            onTap: () async {
                              List<Webinar> webinarList =
                                  await ApiService.getAllWebinar("1");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WebinarListPage(
                                            title: "Webinar",
                                            webinarList: webinarList,
                                          )));
                            },
                            child: _viewAll),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        WebinarDetail webinarDetail =
                            await ApiService.getWebinarDetail("1");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebinarDetailPage(
                                      webinarDetails: webinarDetail,
                                      title: "Webinar",
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Image.asset(
                          "assets/drawable-xxhdpi/webinar.png",
                          height: 172.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //end of webinar

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 30.0,
                          ),
                          child: Text(
                            "Useful Blogs",
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.black),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            List<Blog> blogList =
                                await ApiService.getAllBlog("1");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlogList(
                                  blogList: blogList,
                                  list: usefulBlogList,
                                  title: "Useful Blogs",
                                ),
                              ),
                            );
                          },
                          child: _viewAll,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        BlogDetail blogDetail =
                            await ApiService.getBlogDetail("1");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlogDetailPage(
                              blogDetails: blogDetail,
                              title: "Useful Blogs",
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Image.asset(
                          "assets/drawable-xxhdpi/useful_blog.png",
                          height: 172.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //end of usefulblogs

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 30.0,
                          ),
                          child: Text(
                            "Exam Tips",
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.black),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExamTipListPage(
                                            title: "Exam Tips",
                                            list: examTipList,
                                          )));
                            },
                            child: _viewAll),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            for (var tip in exam_tips)
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ExamDetailPage()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    // top: 10.0,
                                    left: 10.0,
                                  ),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Image.asset(
                                        tip[2],
                                        height: 200.0,
                                        width: 125,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          tip[0],
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          tip[1],
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    //end of examtips

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            top: 30.0,
                          ),
                          child: Text(
                            "Inspiring Videos",
                            style:
                                TextStyle(fontSize: 24.0, color: Colors.black),
                          ),
                        ),
                        InkWell(
                            onTap: () async {
                              List<Video> videoList =
                                  await ApiService.getAllVideo("1");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoList(
                                            videoList: videoList,
                                            list: videoList,
                                            title: "Inspiring Videos",
                                          )));
                            },
                            child: _viewAll),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        VideoDetail videoDetail =
                            await ApiService.getVideoDetail("1");
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
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          left: 20.0,
                          right: 20.0,
                          bottom: 20.0,
                        ),
                        child: Image.asset(
                          "assets/drawable-xxhdpi/inspiring_video.png",
                          height: 172.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //end of inspiringvideos
                    //
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color.fromRGBO(72, 207, 173, 1);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.51);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.48,
        size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.52,
        size.width * 1.0, size.height * 0.495);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LightCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color.fromRGBO(116, 218, 193, 1);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.44);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.49,
        size.width * 0.5, size.height * 0.46);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.44,
        size.width * 1.0, size.height * 0.48);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
