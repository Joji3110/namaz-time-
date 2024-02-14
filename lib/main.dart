import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_namaz/bloc/namaz_time_bloc.dart';
import 'package:time_namaz/cubit/city_cubit.dart';
import 'package:time_namaz/cubit/country_cubit.dart';
import 'package:time_namaz/cubit/navigation_cubit.dart';
import 'package:time_namaz/navigation/navigation_app.dart';
import 'package:time_namaz/repositories/namaz_repository.dart';
import 'package:time_namaz/utils/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final NamazTimeRepository namazTimeRepository = NamazTimeRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NamazTimeBloc(
            namazTimeRepository: namazTimeRepository,
          ),
        ),
        BlocProvider(create: (context) => NavigationCubit()),
        BlocProvider(create: (context) => CountryCubit()),
        BlocProvider(
          create: (context) => CityCubit(
            countryCubit: context.read<CountryCubit>(),
          ),
        ),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darktTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: AppNavigation.router,
    );
  }
}
