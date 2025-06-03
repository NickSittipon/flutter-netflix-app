import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/core/config/theme/app_colors.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/domain/auth/usecase/signup.dart';
import 'package:movie_app/presentation/auth/pages/signin.dart';

import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

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
            _signupText(),
            SizedBox(height: 30),
            _emialField(),
            SizedBox(height: 30),
            _passwordField(),
            SizedBox(height: 60),
            _signinButton(),
            SizedBox(height: 20),
            _signinText(context),
          ],
        )
      ), 
    );
  }

  Widget _signupText(){
    return Text(
      'Sign Up',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _emialField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
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

  Widget _signinButton() {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async {
        SignupUsecase(
          authRepository : AuthRepositoryImp(
            authApiService : AuthApiServiceImpl()
            )
        ).call(
          params: SignupReqParams(
            email: _emailController.text, 
            password: _passwordController.text)
        );
      },
      onSuccess: (){}, 
      onFailure: (error) {},
    );
  }

    Widget _signinText(BuildContext context) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Do have an account?",
            ),
            TextSpan(
              text: ' Sign In',
              style: TextStyle(
                color: Colors.blue,
              ),
              recognizer: TapGestureRecognizer()..onTap = (){
                AppNavigator.push(context, const SigninPage());
              }
            )
          ]
        )
      );
    }
}