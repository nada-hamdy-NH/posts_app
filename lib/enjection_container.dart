import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app/core/network/network_info.dart';
import 'package:posts_app/featuers/posts/data/data_sourses/local_data_source.dart';
import 'package:posts_app/featuers/posts/data/data_sourses/remote_data_source.dart';
import 'package:posts_app/featuers/posts/data/reposatories/post_repository_impl.dart';
import 'package:posts_app/featuers/posts/domain/reposatories/post.dart';
import 'package:posts_app/featuers/posts/domain/usecases/add_post.dart';
import 'package:posts_app/featuers/posts/domain/usecases/delete_post.dart';
import 'package:posts_app/featuers/posts/domain/usecases/get_all_posts.dart';
import 'package:posts_app/featuers/posts/domain/usecases/update_post.dart';
import 'package:posts_app/featuers/posts/representation/bloc/add_delete_update_oost/add_delete_update_bloc.dart';
import 'package:posts_app/featuers/posts/representation/bloc/posts/posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! features posts

  //Bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() =>
      AddDeleteUpdateBloc(addPost: sl(), deletePost: sl(), updatePost: sl()));

  //Usecases
  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePostUsecase(sl()));
  sl.registerLazySingleton(() => DeletePostusecase(sl()));

  //Reposatory
  sl.registerLazySingleton<PostRepository>(() => PostsrepostoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //Datasources
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: sl()));

  //! core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

  /// external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
