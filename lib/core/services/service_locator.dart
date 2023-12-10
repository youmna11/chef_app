import 'package:chef_app/core/bloc/cubit/global_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/auth/data/reposetry/auth_reposetry.dart';
import '../../features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import '../../features/home/home_cubit/home_cubit.dart';
import '../database/api/api_consumer.dart';
import '../database/api/dio_consumer.dart';
import '../database/cache_helper/cache_helper.dart';

final sl = GetIt.instance;
void initServiceLocator(){
  //cubits
  sl.registerLazySingleton(()=> GlobalCubit());
  sl.registerLazySingleton(()=> LoginCubit(sl()));
  sl.registerLazySingleton(()=> ForgetPasswordCubit(sl()));
  sl.registerLazySingleton(()=> HomeCubit());

  //auth feature
  sl.registerLazySingleton(() => AuthRepository());
//external
  sl.registerLazySingleton(()=> CacheHelper());
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());

}