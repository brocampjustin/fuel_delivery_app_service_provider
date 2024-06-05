import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_delivery_app_service_provider/config/theme/theme_data.dart';
import 'package:fuel_delivery_app_service_provider/di.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/saveuser_data_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/singn_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/bloc/bloc/auth_bloc.dart';

import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/layout/responsive_layout.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/login_page.dart';
import 'package:fuel_delivery_app_service_provider/firebase_options.dart';

import 'core/presentaion/pages/layout/desktop_body.dart';
import 'core/presentaion/pages/layout/mobile_body.dart';

void main() async {
  setUP();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
              saveUserDataUseCase: locator<SaveUserDataUseCase>(),
              signUpUsecase: locator<SignUpUsecase>()),
        )
      ],
      child: MaterialApp(
          theme: AppTheme.lightTheme,
          home: FutureBuilder(
            future: locator<SignUpUsecase>().isLogedIn(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return ResponsiveHome(mobileBody: MobileHome(), desktopBody: DesktopHome());
              } else {
                return LoginPage();
              }
            },
          )),
    );
  }
}
