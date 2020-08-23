class Workout {
  final String workoutId;
  final String workoutBookImage;
  final String workoutBookName;
  final String workoutBookShortDetail;
  final String workoutAuthorName;
  final String workoutBookPrice;
  final String workoutBookDiscountPrice;

  Workout({
    this.workoutId,
    this.workoutBookImage,
    this.workoutBookName,
    this.workoutBookShortDetail,
    this.workoutAuthorName,
    this.workoutBookPrice,
    this.workoutBookDiscountPrice,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      workoutId: json["workoutId"],
      workoutBookImage: json["workoutBookImage"],
      workoutBookName: json["workoutBookName"],
      workoutBookShortDetail: json["workoutBookShortDetail"],
      workoutAuthorName: json["workoutAuthorName"],
      workoutBookPrice: json["workoutBookPrice"],
      workoutBookDiscountPrice: json["workoutBookDiscountPrice"],
    );
  }
}
