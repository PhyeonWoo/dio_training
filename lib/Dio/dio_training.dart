// import 'package:dio/dio.dart';
//
// class PostRepository {
//   final Dio _dio = Dio(); // 또는 다른 방법으로 Dio 인스턴스를 생성
//
//   Future<void> findById(int id) async {
//     try {
//       Response response = await _dio.get('http://jsonplaceholder.typicode.com/posts/$id');
//       if (response.statusCode == 200) {
//         print('Post found: ${response.data}');
//       } else {
//         print('Post not found');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   Future<void> findAll() async {
//     try {
//       Response response = await _dio.get('http://jsonplaceholder.typicode.com/posts');
//       if (response.statusCode == 200) {
//         print('All posts: ${response.data}');
//       } else {
//         print('Failed to fetch posts');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }
//


import 'dart:convert';
import 'package:dio/dio.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}

class PostRepository {
  final dio = Dio();

  Future<Post> findById(int id) async {
    Response responseFT = await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    Map<String, dynamic> responseMap = responseFT.data;
    Post post = Post.fromJson(responseMap); // Map으로 매핑된 데이터를 Post 오브젝트로 변환
    return post;
  }

  Future<List<Post>> findAll() async {
    Response responseFT = await dio.get("https://jsonplaceholder.typicode.com/posts");
    List<dynamic> responseBody = responseFT.data; // -> List<Map<String, dynamic>>
    List<Post> postList = responseBody.map((e) => Post.fromJson(e)).toList();  // map을 오브젝트로 변환
    return postList;
  }
}
