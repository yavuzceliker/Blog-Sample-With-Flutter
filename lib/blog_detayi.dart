import 'package:blog/model/blog.dart';
import 'package:blog/veri/bloglari_getir.dart';
import 'package:flutter/material.dart';

class BlogDetayi extends StatelessWidget {
  final int blogId;

  const BlogDetayi({@required this.blogId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Blog>(
          future: blogGetir(blogId),
          builder: (context, blogFuture) {
            if (blogFuture.connectionState != ConnectionState.done)
              return Center(child: CircularProgressIndicator());

            if (blogFuture.hasData == null)
              return Center(child: Text("Veri Yok"));

            Blog blog = blogFuture.data;

            return Stack(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: Image.network(
                      blog.url,
                      fit: BoxFit.cover,
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          child: Icon(
                            Icons.chevron_left_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2 - 50),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: Colors.grey,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(blog.date.toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(blog.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                            child: Text(
                          blog.text,
                          style: TextStyle(color: Colors.grey, fontSize: 17),
                        )),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
