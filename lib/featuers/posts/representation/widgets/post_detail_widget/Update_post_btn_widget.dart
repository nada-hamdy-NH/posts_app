import 'package:flutter/material.dart';
import 'package:posts_app/featuers/posts/domain/entities/post.dart';
import 'package:posts_app/featuers/posts/representation/pages/post_add_update_page.dart';

class UpdatePostBtnWidget extends StatelessWidget {
  final Post post;
  const UpdatePostBtnWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PostAddUpdatePage(
                      isUpdatedPost: true,
                      post: post,
                    )));
      },
      label: const Text("Edit"),
      icon: const Icon(Icons.edit),
    );
  }
}
