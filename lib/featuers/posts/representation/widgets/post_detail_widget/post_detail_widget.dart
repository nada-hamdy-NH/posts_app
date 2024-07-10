import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/util/snack_bar_message.dart';
import 'package:posts_app/core/widgets/loading_widget.dart';
import 'package:posts_app/featuers/posts/domain/entities/post.dart';
import 'package:posts_app/featuers/posts/representation/bloc/add_delete_update_oost/add_delete_update_bloc.dart';
import 'package:posts_app/featuers/posts/representation/pages/posts_page.dart';
import 'package:posts_app/featuers/posts/representation/widgets/post_detail_widget/Update_post_btn_widget.dart';
import 'package:posts_app/featuers/posts/representation/widgets/post_detail_widget/delete_dialog_widget.dart';
import 'package:posts_app/featuers/posts/representation/widgets/post_detail_widget/delete_post_btn_widget.dart';

class PostDetailWedgit extends StatelessWidget {
  final Post post;
  const PostDetailWedgit({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            post.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(
            height: 50,
            thickness: 0.025,
          ),
          Text(
            post.body,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const Divider(
            height: 50,
            thickness: 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UpdatePostBtnWidget(post: post),
              DeletePostBtnWidget(postId: post.id!),
            ],
          )
        ],
      ),
    );
  }

  void deleteDialog(context) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<AddDeleteUpdateBloc, AddDeleteUpdateState>(
            listener: (context, state) {
              if (state is MessageAddDeleteUpdatePostState) {
                SnackBarMessage().showSuccesssnackBar(
                    message: state.message, context: context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const PostsPage(),
                    ),
                    (route) => false);
              } else if (state is ErrorAddDeleteUpdatePostState) {
                Navigator.of(context).pop();
                SnackBarMessage().showErrorsnackBar(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingAddDeleteUpdatePostState) {
                return const AlertDialog(
                  title: LoadingWidget(),
                );
              }
              return DeleteDialogWidget(postId: post.id!);
            },
          );
        });
  }
}
