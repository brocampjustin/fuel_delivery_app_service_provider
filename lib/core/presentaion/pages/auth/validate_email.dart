import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_delivery_app_service_provider/constants/color/colorpellet.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/bloc/auth_bloc/auth_bloc.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/bloc/auth_bloc/auth_event.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/layout/desktop_body.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/layout/mobile_body.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/home/layout/responsive_layout.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/elevated_button.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/snake_error_bar.dart';

import 'package:lottie/lottie.dart';

class ValidateEmail extends StatelessWidget {
  ValidateEmail({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("this is Validate email page");
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is EmailVaryfiedState) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ResponsiveHome(
                    mobileBody: MobileHome(), desktopBody: DesktopHome()),
              ));
            }

            if (state is EmailVarificationFailedState) {
              ErrorSankeBar.showSnakeBar(
                  context: context, err: "Varification Failed");
            }
          },
          builder: (context, state) {
            return Column(
              children: <Widget>[
                // Lottie.asset("assets/animations/emial.json"),
                TextButton(
                    onPressed: () {
                      authBloc.add(LogoutPressedEvent());
                    },
                    child: Text(
                      "Resend Otp",
                      style: TextStyle(color: colorPellet.primaryColor),
                    )),
                CustomElevetedButton1(
                    formKey: _formKey,
                    buttonFunction: () {
                      authBloc.add(VerifyButtonPressedEvent());
                    },
                    buttonText: "Check veryfied")
              ],
            );
          },
        ),
      ),
    );
  }
}
