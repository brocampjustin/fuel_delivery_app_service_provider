import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_delivery_app_service_provider/config/theme/theme_data.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/check_loging_setvalue_local.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/chick_login_local_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/upload_service_provider_data_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/bloc/register_service_provider_bloc/register_serviceprovider_bloc.dart';
import 'package:fuel_delivery_app_service_provider/di.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/saveuser_data_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/domain/usecases/singn_usecase.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/bloc/auth_bloc/auth_bloc.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/layout/responsive_layout.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/auth/login_page.dart';
import 'package:fuel_delivery_app_service_provider/firebase_options.dart';
import 'core/presentaion/pages/home/layout/desktop_body.dart';
import 'core/presentaion/pages/home/layout/mobile_body.dart';

void main() async {
  setUP();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create:(context)=>RegisterServiceproviderBlocBloc(uploadServiceProviderDataUsecase: UploadServiceProviderDataUsecase()) ),
        BlocProvider(
          create: (context) => AuthBloc(
              // checkLoginSetValueLocalUsecase:
              //     locator<CheckLoginSetValueLocalUsecase>(),
              saveUserDataUseCase: locator<SaveUserDataUseCase>(),
              signUpUsecase: locator<SignUpUsecase>()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: FutureBuilder(
          future: locator<CheckLoginUsecase>().exicute(),
          builder: (context, snapshot) {
            if (snapshot.data != null&& snapshot.data == true) {
              return ResponsiveHome(
                  mobileBody:const MobileHome(), desktopBody: DesktopHome());
            } else {
              return LoginPage();
            }
          },
        ),
      ),
    );
  }
}
