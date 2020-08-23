import 'package:F2F/models/blog_detail_model.dart';
import 'package:F2F/models/blog_model.dart';
import 'package:F2F/screens/home/blog/blog_detail_page.dart';
import 'package:F2F/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:F2F/utils/colors.dart';

class BlogList extends StatefulWidget {
  final List<Blog> blogList;
  final list;
  final title;

  const BlogList({Key key, this.blogList, this.list, this.title})
      : super(key: key);

  @override
  _BlogListState createState() => _BlogListState(blogList, list);
}

class _BlogListState extends State<BlogList> {
  final List<Blog> blogList;
  final videoList;

  _BlogListState(this.blogList, this.videoList);

  inspiringVideoTab(Blog blog) {
    return InkWell(
      onTap: () async {
        BlogDetail blogDetail = await ApiService.getBlogDetail(blog.blogId);
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  offset: Offset(0.0, 4.0),
                  blurRadius: 10.0,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    blog.blogImage ?? "assets/useful_blog/usefulBlog_1.png",
                    height: 100,
                    width: 150,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          blog.blogTitle,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                            children: <Widget>[
                              for (int i = 0; i < 5; i++)
                                Icon(
                                  Icons.star,
                                  color: LightColor.lightTeal,
                                  size: 15.0,
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Author: " + blog.blogAuthor,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: LightColor.lightTeal,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 40.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[200],
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.search),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Search",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.grey),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => InvitePage()));
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.filter_list,
                              // size: 15.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //end of search

            Column(
              children: <Widget>[
                for (Blog blog in blogList) inspiringVideoTab(blog)
              ],
            )
          ],
        ),
      ),
    );
  }
}
