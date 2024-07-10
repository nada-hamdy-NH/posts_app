import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/app_theme.dart';
import 'package:posts_app/enjection_container.dart' as di;
import 'package:posts_app/featuers/posts/representation/bloc/add_delete_update_oost/add_delete_update_bloc.dart';
import 'package:posts_app/featuers/posts/representation/bloc/posts/posts_bloc.dart';
import 'package:posts_app/featuers/posts/representation/pages/posts_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
          BlocProvider(create: (_) => di.sl<AddDeleteUpdateBloc>())
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: apptheme,
            title: "posts app ",
            home: PostsPage()
            ));
          
  
  }}
