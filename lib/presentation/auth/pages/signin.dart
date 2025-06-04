import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/message/display_message.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/data/auth/models/signin_req_params.dart';
import 'package:movie_app/domain/auth/usecase/signin.dart';
import 'package:movie_app/presentation/auth/pages/signup.dart';
import 'package:movie_app/presentation/home/pages/home.dart';
import 'package:movie_app/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top:100,right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            SizedBox(height: 30),
            _emialField(),
            SizedBox(height: 30),
            _passwordField(),
            SizedBox(height: 60),
            _signinButton(context),
            SizedBox(height: 20),
            _signupText(context),
          ],
        )
      ), 
    );
  }

  Widget _signinText(){
    return Text(
      'Sign In',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emialField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
      ),
    ); 
  }

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async => sl<SigninUseCase>().call(
        params: SigninReqParams(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      ),
      onSuccess: (){
        AppNavigator.pushAndRemove(context, const HomePage());
      }, 
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

    Widget _signupText(BuildContext context) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Don't have an account?",
            ),
            TextSpan(
              text: ' Sign Up',
              style: TextStyle(
                color: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()..onTap = (){
                AppNavigator.push(context, SignupPage());
              }
            )
          ]
        )
      );
    }
}