import 'package:blog/blog_listesi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BlogApp());
}

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: BlogListesi());
  }
}
