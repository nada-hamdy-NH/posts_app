import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/exceptions.dart';
import 'package:posts_app/featuers/posts/data/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource{
  Future<List<PostModel>> getCachedPosts();
  Future<Unit>cachePosts(List<PostModel>postModels);

}

class LocalDataSourceImpl implements LocalDataSource{
  final SharedPreferences sharedPreferences ;

  LocalDataSourceImpl({required this.sharedPreferences}); 
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    List postModelsToJson = postModels.map<Map<String,dynamic>>((postModel)=>postModel.toJson())
    .toList();
    sharedPreferences.setString("CACHED_POSTS",json.encode(postModelsToJson));
  return Future.value(unit) ; 
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString  = sharedPreferences.get("CACHED_POSTS");
    if(jsonString != null){
      List decodeJsonData = json.decode(jsonString.toString());
      List<PostModel>jsonToPostModels = decodeJsonData.map<PostModel>(
        (jsonToPostModel)=>PostModel.fromJson(jsonToPostModel)).toList();
    return Future.value(jsonToPostModels) ; 
    }else{
      throw EmptyCacheExeption();
    }

  }
  
}