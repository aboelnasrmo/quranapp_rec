import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapicourse/cubit/quran_cubit.dart';
import 'package:restapicourse/repository/api_repo.dart';
import 'package:restapicourse/services/remote_service.dart';
import 'package:restapicourse/views/home_page.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.apiService});
  final ApiService apiService;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<QuranCubit>(
          create: (context) =>
              QuranCubit(apiRepo: ApiRepo(apiService))..fetchApi(),
        ),
      ],
      child: MaterialApp(
        title: 'Rest API',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        home: const HomePage(),
      ),
    );
  }
}
