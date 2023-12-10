import 'package:chef_app/core/them/app_them.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/bloc/cubit/global_cubit.dart';
import '../core/bloc/cubit/global_state.dart';
import '../core/locale/app_locale.dart';
import '../core/routes/app_routes.dart';
import '../core/utils/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      builder: (context,child)=> BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
      return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('ar', "EG"),
            Locale('en', "US"),
          ],
          locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.intitlRoutes,
          onGenerateRoute: AppRoutes.generateRoute,
          title: 'Flutter Demo',
          theme: getAppTheme());
        },
      ) ,
    );
  }
}


