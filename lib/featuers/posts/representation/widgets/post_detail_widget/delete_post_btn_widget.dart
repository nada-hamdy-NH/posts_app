import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/util/snack_bar_message.dart';
import 'package:posts_app/core/widgets/loading_widget.dart';
import 'package:posts_app/featuers/posts/representation/bloc/add_delete_update_oost/add_delete_update_bloc.dart';
import 'package:posts_app/featuers/posts/representation/pages/posts_page.dart';
import 'package:posts_app/featuers/posts/representation/widgets/post_detail_widget/delete_dialog_widget.dart';

class DeletePostBtnWidget extends StatelessWidget {
  final int postId;
  const DeletePostBtnWidget({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: ()=>deleteDialog(context , postId),
      label: const Text("Delete"),
      icon: const Icon(Icons.delete),
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.redAccent)),
    );
  }
  void deleteDialog(BuildContext context , int postId) {
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
                      builder: (_) => PostsPage(),
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
                return AlertDialog(
                  title: LoadingWidget(),
                );
              }
                return DeleteDialogWidget(postId:postId);
            },
          );
        });
  }
}
