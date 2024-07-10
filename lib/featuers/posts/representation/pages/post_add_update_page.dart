import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/util/snack_bar_message.dart';
import 'package:posts_app/core/widgets/loading_widget.dart';
import 'package:posts_app/featuers/posts/domain/entities/post.dart';
import 'package:posts_app/featuers/posts/representation/bloc/add_delete_update_oost/add_delete_update_bloc.dart';
import 'package:posts_app/featuers/posts/representation/pages/posts_page.dart';
import 'package:posts_app/featuers/posts/representation/widgets/Post_add_update_page/form_widget.dart';

class PostAddUpdatePage extends StatelessWidget {
  final Post? post;
  final bool isUpdatedPost;
  const PostAddUpdatePage({super.key, this.post, required this.isUpdatedPost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(title: Text(isUpdatedPost ? "Edit Post" : "Add Post"));
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: BlocConsumer<AddDeleteUpdateBloc, AddDeleteUpdateState>(
          listener: (context, state) {
            if (state is MessageAddDeleteUpdatePostState) {
              SnackBarMessage().showSuccesssnackBar(
                  message: state.message, context: context);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const PostsPage()),
                  (route) => false);
            } else if (state is ErrorAddDeleteUpdatePostState) {
              SnackBarMessage()
                  .showErrorsnackBar(message: state.message, context: context); 
            }
          },
          builder: (context, state) {
            if (state is LoadingAddDeleteUpdatePostState) {
              return const LoadingWidget();
            }
            return FormWidget(
                isUpdatedPost: isUpdatedPost,
                post: isUpdatedPost ? post : null,
                isUpdatePost: isUpdatedPost);
          },
        ),
      ),
    );
  }
}
