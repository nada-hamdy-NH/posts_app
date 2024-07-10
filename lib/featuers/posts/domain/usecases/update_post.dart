import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failures.dart';
import 'package:posts_app/featuers/posts/domain/entities/post.dart';
import 'package:posts_app/featuers/posts/domain/reposatories/post.dart';

class UpdatePostUsecase{
  final PostRepository repository ; 
  UpdatePostUsecase(this.repository);

  Future<Either<Failure , Unit>>call(Post post)async{
    return await repository.updatePost(post);
  } 
}