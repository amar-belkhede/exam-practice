class WorkoutDetail {
  final String workoutId;
  final String workoutBookImage;
  final String workoutBookName;
  final String workoutBookShortDetail;
  final String workoutAuthorName;
  final String workoutBookPrice;
  final String workoutBookDiscountPrice;
  final String workoutDetailId;
  final String workoutBookDetail;
  final String workoutBookDetailDate;

  WorkoutDetail({
    this.workoutId,
    this.workoutBookImage,
    this.workoutBookName,
    this.workoutBookShortDetail,
    this.workoutAuthorName,
    this.workoutBookPrice,
    this.workoutBookDiscountPrice,
    this.workoutDetailId,
    this.workoutBookDetail,
    this.workoutBookDetailDate,
  });

  factory WorkoutDetail.fromJson(Map<String, dynamic> json) {
    return WorkoutDetail(
      workoutId: json["workoutId"],
      workoutBookImage: json["workoutBookImage"],
      workoutBookName: json["workoutBookName"],
      workoutBookShortDetail: json["workoutBookShortDetail"],
      workoutAuthorName: json["workoutAuthorName"],
      workoutBookPrice: json["workoutBookPrice"],
      workoutBookDiscountPrice: json["workoutBookDiscountPrice"],
      workoutDetailId: json["workoutDetailId"],
      workoutBookDetail: json["workoutBookDetail"],
      workoutBookDetailDate: json["workoutBookDetailDate"],
    );
  }
}
