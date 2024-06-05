import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_delivery_app_service_provider/constants/color/colorpellet.dart';
import 'package:fuel_delivery_app_service_provider/constants/fonts/fonts.dart';

import 'package:fuel_delivery_app_service_provider/constants/sizes.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/bloc/bloc/auth_bloc.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/bloc/bloc/auth_event.dart';

import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/layout/desktop_body.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/layout/mobile_body.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/layout/responsive_layout.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/sign_up_page.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/validate_email.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/check_box.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/elevated_button.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/email_feeld.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/password_feeld.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/snake_error_bar.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  final bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    print("this is loginpage");
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
      backgroundColor: ColorPellet.primaryLite,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginState) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => ResponsiveHome(
                      mobileBody: MobileHome(), desktopBody: DesktopHome()),
                ),
                (route) => false);
          }
          if (state is LoginErrorState) {
            print('the errror is ${state.err}');
            ErrorSankeBar.showSnakeBar(context: context, err: state.err);
          }

          if (state is LoginNotVerifydeState) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ValidateEmail(),
            ));
          }
        },
        child: Center(
          child: Container(
            color: ColorPellet.whiteColor,
            width: 400,
            height: 450,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log in",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 29,
                          fontFamily: AppFonts.lexendBold),
                    ),
                    Gap(CustomSize.size1),
                    Gap(CustomSize.size1),
                    EmailFeild(
                      controller: emailController,
                      prefinxIcon: Icons.email_outlined,
                      hintText: 'Enter your email',
                      labelText: 'Email',
                    ),
                    Gap(CustomSize.size1),
                    PassWordFeeld(
                      controller: passWordController,
                    ),
                    Gap(CustomSize.size1),
                    CheckBoxWidget(
                      rememberMe: _rememberMe,
                    ),
                    Gap(CustomSize.size1),
                    CustomElevetedButton1(
                        formKey: _formKey,
                        buttonFunction: () {
                          authBloc.add(LoginButtonPressedEvent(
                              email: emailController.text,
                              password: passWordController.text));
                        },
                        buttonText: "Sing in"),
                    Gap(CustomSize.size1),
                    Row(
                      children: [
                        Gap(CustomSize.size1 * 3.5),
                        Text("dont have an account ?"),
                        Gap(CustomSize.size1),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SingUpPage(),
                                ));
                              },
                              child: Text(
                                "Sing up",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: ColorPellet.primaryColor),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
