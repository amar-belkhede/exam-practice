class Webinar {
  final String webinarId;
  final String webinarImage;
  final String webinarTitle;
  final String webinarShortDetail;
  final String webinarPrice;
  final String webinarDiscountPrice;
  final String webinarConductedById;
  final String firstName;
  final String lastName;

  Webinar({
    this.webinarId,
    this.webinarImage,
    this.webinarTitle,
    this.webinarShortDetail,
    this.webinarPrice,
    this.webinarDiscountPrice,
    this.webinarConductedById,
    this.firstName,
    this.lastName,
  });

  factory Webinar.fromJson(Map<String, dynamic> json) {
    return Webinar(
      webinarId: json["webinarId"],
      webinarImage: json["webinarImage"],
      webinarTitle: json["webinarTitle"],
      webinarShortDetail: json["webinarShortDetail"],
      webinarPrice: json["webinarPrice"],
      webinarDiscountPrice: json["webinarDiscountPrice"],
      webinarConductedById: json["webinarConductedById"],
      firstName: json["firstName"],
      lastName: json["lastName"],
    );
  }
}
