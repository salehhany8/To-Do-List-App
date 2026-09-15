import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/core/navigation/app_router.dart';
import 'package:todo_list_app/core/style/app_themes.dart';
import 'package:todo_list_app/core/utils/firebase/auth_services.dart';
import 'package:todo_list_app/core/utils/firebase/firebase_services.dart';
import 'package:todo_list_app/features/home/presentation/manager/auth_cubit.dart';
import 'package:todo_list_app/features/home/presentation/manager/home_cubit.dart';

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => HomeCubit(
            firebaseServices: FirebaseServices()
          )),
          BlocProvider<AuthCubit>(
            create: (_) => AuthCubit(
              authServices: AuthServices(),
          ),
),
      ], 
      child: SafeArea(child: MaterialApp.router(
          title: "ToDo List",
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        routerConfig: AppRouter.appRouter,
      )
      
      )
    );

  }
}