class BlogDetail {
  final String blogId;
  final String blogImage;
  final String blogTitle;
  final String blogShortDesc;
  final String blogLink;
  final String blogAuthor;
  final String blogDT;
  final String firstName;
  final String lastName;
  final String emailId;

  BlogDetail({
    this.blogId,
    this.blogImage,
    this.blogTitle,
    this.blogShortDesc,
    this.blogLink,
    this.blogAuthor,
    this.blogDT,
    this.firstName,
    this.lastName,
    this.emailId,
  });

  factory BlogDetail.fromJson(Map<String, dynamic> json) {
    return BlogDetail(
      blogId: json["blogId"],
      blogImage: json["blogImage"],
      blogTitle: json["blogTitle"],
      blogShortDesc: json["blogShortDesc"],
      blogLink: json["blogLink"],
      blogAuthor: json["blogAuthor"],
      blogDT: json["blogDT"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      emailId: json["emailId"],
    );
  }
}
