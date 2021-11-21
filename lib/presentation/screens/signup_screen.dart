import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../config/colors.dart';
import '../../constants/constants.dart';
import '../../constants/route_paths.dart';
import '../../utils/utils.dart';
import '../common/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = '', password = '';
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoggedInState) {
          Navigator.pushReplacementNamed(context, RoutePaths.homeScreen);
        }

        if (state is AuthFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMsg),
              backgroundColor: ThemeColors.mainColor,
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 12,
              right: 36,
              left: 36,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CircleAvatar(
                  radius: 40,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  Constants.signUpButtonText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 100,
                ),
                Text(
                  Constants.email,
                  style: Theme.of(context).textTheme.headline6,
                ),
                CustomTextField(
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                  inputType: TextInputType.emailAddress,
                  isPassword: false,
                  text: Constants.exampleEmail,
                  errorText: Constants.invalidEmail,
                  validator: (String? value) {
                    if (value != null) return Email.validate(value);
                    return true;
                  },
                ),
                const SizedBox(height: 36),
                Text(
                  Constants.password,
                  style: Theme.of(context).textTheme.headline6,
                ),
                CustomTextField(
                  onChanged: (String value) {
                    setState(() {
                      password = value;
                    });
                  },
                  inputType: TextInputType.visiblePassword,
                  isPassword: true,
                  text: Constants.examplePassword,
                ),
                const SizedBox(
                  height: 48,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (Email.validate(email, allowEmpty: false) &&
                        Password.validate(password, allowEmpty: false)) {
                      context.read<AuthBloc>().add(
                            AuthRegisterEvent(email, password),
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            Constants.authenticationError,
                          ),
                          backgroundColor: ThemeColors.mainColor,
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthStartState) {
                        return const CircularProgressIndicator();
                      } else {
                        return Text(
                          Constants.signUpButtonText,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: ThemeColors.backgroundColor),
                        );
                      }
                    },
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  Constants.signUpScreenHint,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutePaths.signInScreen),
                  child: Text(
                    Constants.signInButtonText,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
