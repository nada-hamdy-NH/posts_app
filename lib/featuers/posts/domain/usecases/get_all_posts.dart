import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failures.dart';
import 'package:posts_app/featuers/posts/domain/entities/post.dart';
import 'package:posts_app/featuers/posts/domain/reposatories/post.dart';

class GetAllPostsUsecase{

final PostRepository repository ; 
GetAllPostsUsecase(this.repository);
Future<Either<Failure , List<Post>>>call()async{
  return await repository.getAllPosts();
}
}  