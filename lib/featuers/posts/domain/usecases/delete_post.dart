import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/failures.dart';
import 'package:posts_app/featuers/posts/domain/reposatories/post.dart';

class DeletePostusecase{
  final PostRepository repository ; 
DeletePostusecase(this.repository);

Future<Either<Failure , Unit>>call(int postId)async{
  return await repository.deletePost(postId); 
}

}