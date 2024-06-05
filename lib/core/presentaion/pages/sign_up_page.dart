import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuel_delivery_app_service_provider/constants/fonts/fonts.dart';
import 'package:fuel_delivery_app_service_provider/constants/sizes.dart';
import 'package:fuel_delivery_app_service_provider/core/data/models/auth_model.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/bloc/bloc/auth_bloc.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/bloc/bloc/auth_event.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/pages/validate_email.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/check_box.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/elevated_button.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/password_feeld.dart';
import 'package:fuel_delivery_app_service_provider/core/presentaion/widgets/snake_error_bar.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../constants/color/colorpellet.dart';
import '../widgets/email_feeld.dart';

class SingUpPage extends StatelessWidget {
  SingUpPage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  final bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    print("this is Sing in page");
    final authBloc = context.read<AuthBloc>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SingnUpFaildState) {
            ErrorSankeBar.showSnakeBar(context: context, err: state.err);
          } else if (state is SignUpSucessState) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ValidateEmail(),
            ));
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: ColorPellet.primaryLite,
          child: Center(
            child: Container(
              color: ColorPellet.whiteColor,
              width: 400,
              height: 550,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LargeText(),
                      Gap(CustomSize.size1),
                      Gap(CustomSize.size1),
                      EmailFeild(
                        controller: nameController,
                        prefinxIcon: Icons.person_outline,
                        hintText: 'Enter your name',
                        labelText: 'Name',
                      ),
                      Gap(CustomSize.size1),
                      EmailFeild(
                        controller: emailController,
                        prefinxIcon: Icons.email_outlined,
                        hintText: 'Enter your email',
                        labelText: 'Email',
                      ),
                      Gap(CustomSize.size1),
                      PhoneField(
                        controller: phoneNumberController,
                      ),
                      Gap(CustomSize.size1),
                      PassWordFeeld(
                        controller: passWordController,
                      ),
                      CheckBoxWidget(
                        rememberMe: _rememberMe,
                      ),
                      Gap(CustomSize.size1),
                      CustomElevetedButton1(
                          formKey: _formKey,
                          buttonFunction: () {
                            authBloc.add(SingUpButtonPressedEvent(
                                user: UserModel(
                                    email: emailController.text,
                                    password: passWordController.text,
                                    phoneNumber: phoneNumberController.text,
                                    name: nameController.text)));
                          },
                          buttonText: "Singn in"),
                      Gap(CustomSize.size1),
                      Row(
                        children: [
                          Gap(CustomSize.size1 * 3.5),
                          Text("Alrady have an account ?"),
                          Gap(CustomSize.size1),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Log in",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: ColorPellet.primaryColor),
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
      ),
    );
  }
}

class LargeText extends StatelessWidget {
  const LargeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Sing in",
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 29,
          fontFamily: AppFonts.lexendBold),
    );
  }
}

class PhoneField extends StatelessWidget {
  TextEditingController controller;
  PhoneField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: IntlPhoneField(
        controller: controller,
        decoration: InputDecoration(
          counterText: "",
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'IN',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
      ),
    );
  }
}
