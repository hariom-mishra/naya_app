import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naya_app/bloc/user_bloc.dart';
import 'package:naya_app/custom_widgets/custom_button.dart';
import 'package:naya_app/custom_widgets/custom_loader.dart';
import 'package:naya_app/custom_widgets/custom_textfield.dart';
import 'package:naya_app/home.dart';
import 'package:naya_app/constants/utils.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var key = GlobalKey<FormState>();
  UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    _userBloc.add(UserInitialEVent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      // bloc: _userBloc,
      listenWhen: (previous, current) => current is ActiveState,
      buildWhen: (previous, current) => current is! ActiveState,
      listener: (context, state) {
        if (state is AuthFailure) {
          
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          context.read<UserBloc>().add(UserInitialEVent ()); 
        } else if (state is AuthSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case UserInitial:
            return Scaffold(
              appBar: AppBar(
                title: const Text('Sign In'),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Form(
                    key: key,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomTextField(
                              controller: emailController,
                              hint: 'Email',
                              hide: false),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              controller: passwordController,
                              hint: 'Password',
                              hide: true),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomButton(
                              voidCallback: () {
                                if (key.currentState!.validate()) {
                                  context.read<UserBloc>().add(
                                      AuthLoginRequested(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim()));
                                }
                              },
                              text: 'Sign IN')
                        ],
                      ),
                    )),
              ),
            );

          case AuthLoading:
            if (state is! AuthFailure)
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Sign In'),
                  centerTitle: true,
                ),
                body: SafeArea(
                  child: Form(
                      key: key,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CustomTextField(
                                controller: emailController,
                                hint: 'Email',
                                hide: false),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                controller: passwordController,
                                hint: 'Password',
                                hide: true),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomLoader(),
                          ],
                        ),
                      )),
                ),
              );
            else
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Sign In'),
                  centerTitle: true,
                ),
                body: SafeArea(
                  child: Form(
                      key: key,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CustomTextField(
                                controller: emailController,
                                hint: 'Email',
                                hide: false),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                controller: passwordController,
                                hint: 'Password',
                                hide: true),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomButton(
                                voidCallback: () {
                                  if (key.currentState!.validate()) {
                                    context.read<UserBloc>().add(
                                        AuthLoginRequested(
                                            email: emailController.text.trim(),
                                            password: passwordController.text
                                                .trim()));
                                  }
                                },
                                text: 'Sign IN')
                          ],
                        ),
                      )),
                ),
              );

          default:
            return SizedBox();
        }
      },
    );
  }
}
