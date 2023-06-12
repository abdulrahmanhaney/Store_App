import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/home_cubit/home_cubit.dart';
import 'package:store_app/cubits/update_cubit/update_cubit.dart';
import 'package:store_app/screens/homeScreen.dart';
import 'package:store_app/screens/splashScreen.dart';
import 'package:store_app/screens/updateProductScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          colorSchemeSeed: Colors.black,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(
                fontFamily: "MyFont-Bold",
                color: Colors.black,
                fontSize: 20,
              ),
              centerTitle: true),
        ),
        routes: {
          SplashScreen.id: (context) => const SplashScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          UpdateProductScreen.id: (context) => const UpdateProductScreen(),
        },
        initialRoute: HomeScreen.id,
      ),
    );
  }
}
