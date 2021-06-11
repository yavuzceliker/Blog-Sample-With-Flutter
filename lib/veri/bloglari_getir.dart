import 'dart:convert';

import 'package:blog/model/blog.dart';
import 'package:http/http.dart' as http;

Future<List<Blog>> bloglariGetir() async {
  http.Response response = await http.get(Uri.parse(
      "https://jsonplaceholder.typicode.com/photos")); //sitedeki json verisini okuyoruz.

  if (response.statusCode != 200)
    return null; // StatusCode 200 değilse işlem başarısız olmuş demektir.

  String gelenJson = response.body; //sitedeki json dosyasını okuduk.

  List<dynamic> mapListesi =
      json.decode(gelenJson); // okuduğumuz json'ı map listesi yaptık.

  List<Blog> blogListesi = mapListesi
      .map((e) => Blog.fromMap(e))
      .toList(); // listeyi map ile parça parça okuyup blog'lara dönüştürüp, bu parçaları da toList ile bir liste yaptık.

  return blogListesi;
}

Future<Blog> blogGetir(int blogId) async {
  http.Response response = await http.get(Uri.parse(
      "https://jsonplaceholder.typicode.com/photos/$blogId")); //sitedeki bir tane json verisini okuyoruz. blogId aldığımız için photos/2 şeklinde 2. veriyi alıyoruz.

  if (response.statusCode != 200)
    return null; // StatusCode 200 değilse işlem başarısız olmuş demektir.

  String gelenJson = response.body; //sitedeki json dosyasını okuduk.

  Map<String, dynamic> map = json.decode(
      gelenJson); // okuduğumuz json'ı map yaptık. Tek veri olduğu için liste olmadı.

  Blog blog = Blog.fromMap(map); // Aldığımız map'i blog'a dönüştürdük.

  return blog;
}
