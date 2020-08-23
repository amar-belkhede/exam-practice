class Video {
  final String ivId;
  final String ivTitle;
  final String ivDesc;
  final String ivLink;
  final String ivChannel;
  final String ivThumb;
  final String ivCreatedDT;
  final String firstName;
  final String lastName;
  final String emailId;

  Video({
    this.ivId,
    this.ivTitle,
    this.ivDesc,
    this.ivLink,
    this.ivChannel,
    this.ivThumb,
    this.ivCreatedDT,
    this.firstName,
    this.lastName,
    this.emailId,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      ivId: json["ivId"],
      ivTitle: json["ivTitle"],
      ivDesc: json["ivDesc"],
      ivLink: json["ivLink"],
      ivChannel: json["ivChannel"],
      ivThumb: json["ivThumb"],
      ivCreatedDT: json["ivCreatedDT"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      emailId: json["emailId"],
    );
  }
}
