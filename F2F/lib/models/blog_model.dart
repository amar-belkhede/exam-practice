class Blog {
  final String blogId;
  final String blogImage;
  final String blogTitle;
  final String blogShortDesc;
  final String blogLink;
  final String blogAuthor;
  final String blogDT;

  Blog({
    this.blogId,
    this.blogImage,
    this.blogTitle,
    this.blogShortDesc,
    this.blogLink,
    this.blogAuthor,
    this.blogDT,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      blogId: json["blogId"],
      blogImage: json["blogImage"],
      blogTitle: json["blogTitle"],
      blogShortDesc: json["blogShortDesc"],
      blogLink: json["blogLink"],
      blogAuthor: json["blogAuthor"],
      blogDT: json["blogDT"],
    );
  }
}
