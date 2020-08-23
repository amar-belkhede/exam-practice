class Url {
  // static const baseUrl = "https://www.testbee.in";
  static const baseUrl = "http://10.0.2.2:3000";

  static const login = "$baseUrl/testbee_uat/api/login";
  static const register = "$baseUrl/testbee_uat/api/register";
  static const verify_otp = "$baseUrl/testbee_uat/api/register/verify_otp";
  static const resend_otp = "$baseUrl/testbee_uat/api/register/resend_otp";

  static const exams = "$baseUrl/testbee_uat/api/exams";
  static const exams_set_list =
      "$baseUrl/testbee_uat/api/exam_sets/exams_set_list?examId=";

  static const add_to_cart = "$baseUrl/testbee_uat/api/cart/add_to_cart";
  static const remove_product = "$baseUrl/testbee_uat/api/cart/remove_product";
  static const cart_items = "$baseUrl/testbee_uat/api/cart/cart_items";

  static const workout_all = "$baseUrl/f2f/api/view_all_workout";
  static const workout_detail = "$baseUrl/f2f/api/view_workout_detail";

  static const webinar_all = "$baseUrl/f2f/api/view_all_webinar";
  static const webinar_detail = "$baseUrl/f2f/api/view_webinar_detail";

  static const blog_all = "$baseUrl/f2f/api/view_all_blog";
  static const blog_detail = "$baseUrl/f2f/api/view_blog_detail";

  static const video_all = "$baseUrl/f2f/api/view_all_video";
  static const video_detail = "$baseUrl/f2f/api/view_video_detail";

  static const examsLocalhost = "http://10.0.2.2:3001/exams";
}
