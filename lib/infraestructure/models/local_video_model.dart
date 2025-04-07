// To parse this JSON data, do
//
//     final videoPost = videoPostFromJson(jsonString);

import 'dart:convert';

LocalVideoPost videoPostFromJson(String str) => LocalVideoPost.fromJson(json.decode(str));

String videoPostToJson(LocalVideoPost data) => json.encode(data.toJson());

class LocalVideoPost {
    final String name;
    final String videoUrl;
    final int likes;
    final int views;

    LocalVideoPost({
        required this.name,
        required this.videoUrl,
        required this.likes,
        required this.views,
    });

    factory LocalVideoPost.fromJson(Map<String, dynamic> json) => LocalVideoPost(
        name: json["name"],
        videoUrl: json["videoUrl"],
        likes: json["likes"],
        views: json["views"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
    };
}
