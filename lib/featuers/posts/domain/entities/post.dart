import 'package:equatable/equatable.dart';

class Post extends Equatable{ 
final int? id;
final String body ; 
final String title ; 

Post({ this.id , required this.title ,required this.body});

  @override
  List<Object?> get props => [id , body , title];

} 