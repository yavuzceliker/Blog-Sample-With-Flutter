import 'package:blog/blog_detayi.dart';
import 'package:blog/model/blog.dart';
import 'package:blog/veri/bloglari_getir.dart';
import 'package:flutter/material.dart';

class BlogListesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog Listesi"),
      ),
      body: FutureBuilder<List<Blog>>(
        future: bloglariGetir(),
        builder: (context, blogListesiFuture) {
          if (blogListesiFuture.connectionState != ConnectionState.done)
            return Center(child: CircularProgressIndicator());

          if (blogListesiFuture.hasData == null)
            return Center(child: Text("Veri Yok"));

          List<Blog> blogListesi = blogListesiFuture.data;

          return ListView.builder(
            itemCount: 100,
            itemBuilder: (context, i) {
              Blog blog = blogListesi[i];
              return Card(
                elevation: 3,
                color: Colors.grey.shade200,
                child: ListTile(
                  title: Text(
                    blog.title,
                    style: TextStyle(fontSize: 12),
                  ),
                  subtitle: Text(blog.url),
                  trailing: IconButton(
                      icon: Icon(Icons.open_in_new),
                      onPressed: () async => Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            var blogDetayi = BlogDetayi(blogId: blog.id);
                            return blogDetayi;
                          }))),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
