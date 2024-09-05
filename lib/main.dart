import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/routes.dart';
import 'core/utils/app_initializers.dart';
import 'dependency_injection.dart' as di;
import 'features/calendar/presentation/bloc/calendar_main_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializers.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CalendarMainCubit>(
            create: (context) => di.sl<CalendarMainCubit>(),
          ),
        ],
        child: MaterialApp.router(
          theme: ThemeData(
            fontFamily: 'Roboto',
          ),
          debugShowCheckedModeBanner: false,
          title: 'Neighborly',
          routerConfig: router,
        ));
  }
}
