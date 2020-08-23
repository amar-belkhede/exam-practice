import 'dart:convert';
import 'package:F2F/helpers/helper_functions.dart';
import 'package:F2F/models/blog_detail_model.dart';
import 'package:F2F/models/blog_model.dart';
import 'package:F2F/models/video_detail_model.dart';
import 'package:F2F/models/video_model.dart';
import 'package:F2F/models/webinar_detail_model.dart';
import 'package:F2F/models/webinar_model.dart';
import 'package:F2F/models/workout_detail_model.dart';
import 'package:F2F/models/workout_model.dart';
import 'package:F2F/utils/url.dart';
import 'package:http/http.dart' as client;

class ApiService {
  // "https://www.testbee.in";

  static Future getLogin(String mobileNo, String password) async {
    // var m="8369529404";

    var data = {"mobileNo": mobileNo, "password": password};

    // var a = "8108550617";
    final response = await client.post(Url.login,
        headers: {"x-authorization": "123456"}, body: data);

    Map decodedResponse = json.decode(response.body);

    print(decodedResponse);
    return decodedResponse;
  }

  static Future getRegistration(String firstName, String lastName,
      String mobileNo, String password) async {
    var data = {
      "firstName": firstName,
      "lastName": lastName,
      "mobileNo": mobileNo,
      "password": password,
      "fk_roleId": "1"
    };

    final response = await client.post(Url.register,
        headers: {"x-authorization": "123456"}, body: data);

    Map decodedResponse = json.decode(response.body);
    print(decodedResponse);
    return decodedResponse;
  }

  static Future verifyOtp(String mobileNo, String otp) async {
    var data = {"mobileNo": mobileNo, "otp": otp};

    final response = await client.post(Url.verify_otp,
        headers: {"x-authorization": "123456"}, body: data);

    final Map result = json.decode(response.body);
    print(result);
    return result;
  }

  static Future resendOtp(String mobileNo) async {
    var data = {"mobileNo": mobileNo};

    final response = await client.post(Url.resend_otp,
        headers: {"x-authorization": "123456"}, body: data);

    final Map result = json.decode(response.body);
    print(result);
    return result;
  }

  static Future getExam() async {
    return await client.get(
      Url.examsLocalhost,
    );
  }

  static Future getExamsSetList(String examId) async {
    var headerData = {
      "x-authorization": "123456",
      "authtoken": await HelperFunctions.getAuthTokenSharedPreference()
    };
    return await client.get(
      Url.exams_set_list + examId,
      headers: headerData,
    );
  }

  static Future addToCart(String examSetId) async {
    var headerData = {
      "x-authorization": "123456",
      "authtoken": await HelperFunctions.getAuthTokenSharedPreference()
    };

    var bodyData = {
      "examSetId": examSetId,
      "studentId": await HelperFunctions.getStudentIdSharedPreference()
    };

    return await client.post(
      Url.add_to_cart,
      headers: headerData,
      body: bodyData,
    );
  }

  static Future removeFromCart(String cartExamSetId) async {
    var headerData = {
      "x-authorization": "123456",
      "authtoken": await HelperFunctions.getAuthTokenSharedPreference()
    };
    var bodyData = {
      "cartExamSetId": cartExamSetId,
      "studentId": await HelperFunctions.getStudentIdSharedPreference()
    };
    return await client.post(
      Url.remove_product,
      headers: headerData,
      body: bodyData,
    );
  }

  static Future getCartItems() async {
    var headerData = {
      "x-authorization": "123456",
      "authtoken": await HelperFunctions.getAuthTokenSharedPreference()
    };
    var bodyData = {
      "studentId": await HelperFunctions.getStudentIdSharedPreference()
    };
    return await client.post(
      Url.cart_items,
      headers: headerData,
      body: bodyData,
    );
  }

  ////////////////////////// TODO: workout ////////////////////////////
  static Future<List<Workout>> getAllWorkout(String pageNumber) async {
    var headerData = {
      "Accept": "application/json",
      "x-authorization": "123456",
    };
    var bodyData = {
      "pageNumber": pageNumber,
    };

    final client.Response response = await client.post(
      Url.workout_all,
      headers: headerData,
      body: bodyData,
    );
    print(response);

    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      List<Workout> workoutList = List<Workout>();
      for (var workout in decode["allWorkoutDetail"]) {
        workoutList.add(Workout.fromJson(workout));
      }
      return workoutList;
    } else {
      throw Exception('Failed to create workout list.');
    }
  }

  ////////////////////////// TODO: workout detail ////////////////////////////
  static Future<WorkoutDetail> getWorkoutDetail(String workoutId) async {
    var headerData = {
      "Accept": "application/json",
      "x-authorization": "123456",
    };
    var bodyData = {
      "workoutId": workoutId,
    };

    final client.Response response = await client.post(
      Url.workout_detail,
      headers: headerData,
      body: bodyData,
    );

    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      return WorkoutDetail.fromJson(decode["workoutDetail"]);
    } else {
      throw Exception('Failed to create workout detail.');
    }
  }

  ////////////////////////// TODO: Webinar  ////////////////////////////
  static Future<List<Webinar>> getAllWebinar(String pageNumber) async {
    var headerData = {
      "Accept": "application/json",
      "x-authorization": "123456",
    };
    var bodyData = {
      "pageNumber": pageNumber,
    };
    final client.Response response = await client.post(
      Url.webinar_all,
      headers: headerData,
      body: bodyData,
    );

    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      // print(decode);
      List<Webinar> webinarList = List<Webinar>();
      for (var workout in decode["allWebinarDetail"]) {
        webinarList.add(Webinar.fromJson(workout));
      }
      return webinarList;
    } else {
      throw Exception('Failed to create webinar.');
    }
  }

  ////////////////////////// TODO: Webinar detail ////////////////////////////
  static Future<WebinarDetail> getWebinarDetail(String webinarId) async {
    var headerData = {
      "Accept": "application/json",
      "x-authorization": "123456",
    };
    var bodyData = {
      "webinarId": webinarId,
    };

    final client.Response response = await client.post(
      Url.webinar_detail,
      headers: headerData,
      body: bodyData,
    );

    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      return WebinarDetail.fromJson(decode["webinarDetail"]);
    } else {
      throw Exception('Failed to create webinar detail.');
    }
  }

  ////////////////////////// TODO: blog  ////////////////////////////
  static Future<List<Blog>> getAllBlog(String pageNumber) async {
    var headerData = {
      "Accept": "application/json",
      "x-authorization": "123456",
    };
    var bodyData = {
      "pageNumber": pageNumber,
    };
    final client.Response response = await client.post(
      Url.blog_all,
      headers: headerData,
      body: bodyData,
    );

    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      // print(decode);
      List<Blog> blogList = List<Blog>();
      for (var workout in decode["allBlogDetail"]) {
        blogList.add(Blog.fromJson(workout));
      }
      return blogList;
    } else {
      throw Exception('Failed to create blog.');
    }
  }

  ////////////////////////// TODO: blog detail ////////////////////////////
  static Future<BlogDetail> getBlogDetail(String blogId) async {
    var headerData = {
      "Accept": "application/json",
      "x-authorization": "123456",
    };
    var bodyData = {
      "blogId": blogId,
    };

    final client.Response response = await client.post(
      Url.blog_detail,
      headers: headerData,
      body: bodyData,
    );

    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      return BlogDetail.fromJson(decode["blogDetail"]);
    } else {
      throw Exception('Failed to create blog detail.');
    }
  }

  ////////////////////////// TODO: video  ////////////////////////////
  static Future<List<Video>> getAllVideo(String pageNumber) async {
    var headerData = {
      "Accept": "application/json",
      "x-authorization": "123456",
    };
    var bodyData = {
      "pageNumber": pageNumber,
    };
    final client.Response response = await client.post(
      Url.video_all,
      headers: headerData,
      body: bodyData,
    );

    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      // print(decode);
      List<Video> videoList = List<Video>();
      for (var workout in decode["allVideoDetail"]) {
        videoList.add(Video.fromJson(workout));
      }
      return videoList;
    } else {
      throw Exception('Failed to create Video.');
    }
  }

  ////////////////////////// TODO: video detail ////////////////////////////
  static Future<VideoDetail> getVideoDetail(String ivId) async {
    var headerData = {
      "Accept": "application/json",
      "x-authorization": "123456",
    };
    var bodyData = {
      "ivId": ivId,
    };

    final client.Response response = await client.post(
      Url.video_detail,
      headers: headerData,
      body: bodyData,
    );

    if (response.statusCode == 200) {
      var decode = json.decode(response.body);
      return VideoDetail.fromJson(decode["videoDetail"]);
    } else {
      throw Exception('Failed to create video detail.');
    }
  }

  // Future
}
