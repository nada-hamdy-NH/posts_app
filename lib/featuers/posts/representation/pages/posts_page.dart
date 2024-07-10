import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/widgets/loading_widget.dart';
import 'package:posts_app/featuers/posts/representation/bloc/posts/posts_bloc.dart';
import 'package:posts_app/featuers/posts/representation/pages/post_add_update_page.dart';
import 'package:posts_app/featuers/posts/representation/widgets/posts_widget/message_display_widget.dart';
import 'package:posts_app/featuers/posts/representation/widgets/posts_widget/post_lisr_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatBtn(context),
    );
  }

  AppBar _buildAppbar() => AppBar(
        title: Text('Posts'),
      );

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if (state is LoadingPostsState) {
          return const LoadingWidget();
        } else if (state is LoadedPostsState) {
          return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: PostListWidget(posts: state.posts));
        } else if (state is ErrorPostState) {
          return MessageDisplayWidget(message: state.message);
        }
        return const LoadingWidget();
      }),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }

  Widget _buildFloatBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => const PostAddUpdatePage(isUpdatedPost: false)));
      },
      child: Icon(Icons.add),
    );
  }
}
