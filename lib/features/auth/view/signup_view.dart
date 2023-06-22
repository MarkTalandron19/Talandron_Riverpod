import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/theme/pallete.dart';
import '../../../common/common.dart';
import '../../../constants/constants.dart';
import '../widgets/auth_field.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final appbar = UIConstants.appBar();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    @override
    void dispose() {
      super.dispose();
      emailController.dispose();
      passwordController.dispose();
    }

    void onSignUp() {
      ref.read(authControllerProvider.notifier).signUp(
          email: emailController.text,
          password: passwordController.text,
          context: context);
    }

    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              AuthField(
                controller: emailController,
                hintText: 'Email',
              ),
              const SizedBox(
                height: 25,
              ),
              AuthField(
                controller: passwordController,
                hintText: 'Password',
              ),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.topRight,
                child: RoundedSmallButton(
                  onTap: onSignUp,
                  label: 'Done',
                  backgroundColor: Pallete.backgroundColor,
                  textColor: Pallete.whiteColor,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: TextSpan(
                    text: "Already have an account?",
                    style: const TextStyle(
                      color: Pallete.blueColor,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                          text: ' Login',
                          style: const TextStyle(
                            color: Pallete.blueColor,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, LoginView.route());
                            })
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
