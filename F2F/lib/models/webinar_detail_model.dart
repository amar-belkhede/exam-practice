class WebinarDetail {
  final String webinarId;
  final String webinarImage;
  final String webinarTitle;
  final String webinarShortDetail;
  final String webinarPrice;
  final String webinarDiscountPrice;
  final String webinarDetail;
  final String webinarFromTime;
  final String webinarToTime;
  final String firstName;
  final String lastName;

  WebinarDetail({
    this.webinarId,
    this.webinarImage,
    this.webinarTitle,
    this.webinarShortDetail,
    this.webinarPrice,
    this.webinarDiscountPrice,
    this.webinarDetail,
    this.webinarFromTime,
    this.webinarToTime,
    this.firstName,
    this.lastName,
  });

  factory WebinarDetail.fromJson(Map<String, dynamic> json) {
    return WebinarDetail(
      webinarId: json["webinarId"],
      webinarImage: json["webinarImage"],
      webinarTitle: json["webinarTitle"],
      webinarShortDetail: json["webinarShortDetail"],
      webinarPrice: json["webinarPrice"],
      webinarDiscountPrice: json["webinarDiscountPrice"],
      webinarDetail: json["webinarDetail"],
      webinarFromTime: json["webinarFromTime"],
      webinarToTime: json["webinarToTime"],
      firstName: json["firstName"],
      lastName: json["lastName"],
    );
  }
}
