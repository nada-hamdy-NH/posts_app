import 'package:flutter/material.dart';
import 'package:posts_app/featuers/posts/domain/entities/post.dart';
import 'package:posts_app/featuers/posts/representation/widgets/post_detail_widget/post_detail_widget.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;
  const PostDetailPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _build_appbar(),
      body: _buildBody(),
    );
  }

  AppBar _build_appbar() => AppBar(
        title: Text("Post Detail"),
      );
  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: PostDetailWedgit(post: post),
      ),
    );
  }
}
