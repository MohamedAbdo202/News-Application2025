import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/features/models/data/data.dart';
import 'package:news/features/viewmodels/news/news_cubit.dart';
import 'package:news/util/network/network_api.dart';

import 'features/view/login_page/login_page.dart';
import 'util/app_constants/app_colors.dart';
import 'util/routes/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///  Screen Util For Responsive Application by .h for height .w for width and .sp for font size
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            ///All My Cubit In The Start Of The Application
            BlocProvider(
              create: (_) => NewsCubit(getNewsData: GetNewsApi()),
            ),
          ],
          child: MaterialApp(
            navigatorKey: AppRouter.navigatorKey,
            onGenerateRoute: AppRouter.generateRoute,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.whiteColor,
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: AppColors.blueColor,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              useMaterial3: true,
            ),
            home: const LoginPage(),
          ),
        );
      },
    );
  }
}
