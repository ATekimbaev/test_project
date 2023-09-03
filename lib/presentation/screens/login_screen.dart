import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/ui_componets/app_colors.dart';
import 'package:test_project/core/ui_componets/app_fonts.dart';
import 'package:test_project/presentation/bloc/bloc/auth_bloc.dart';
import 'package:test_project/router/router.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerPassword = TextEditingController();
    return CupertinoPageScaffold(
      backgroundColor: AppColors.bgGrey,
      navigationBar: const CupertinoNavigationBar(
        border: null,
        backgroundColor: AppColors.bgWhite,
        middle: Text(
          'Авторизация',
          textAlign: TextAlign.center,
          style: AppFonts.w500s15,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.bgWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    AppTextField(
                      controller: controllerEmail,
                      placeholder: 'Логин или почта',
                    ),
                    AppTextField(
                      controller: controllerPassword,
                      placeholder: 'Пароль',
                      isFirst: false,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                print(state);
                state.when(
                  initial: () {},
                  loading: () {},
                  success: (model) {
                    context.router.push(
                      HomeRoute(
                        model: model,
                      ),
                    );
                    return null;
                  },
                  error: (errorText) {
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text('Ошибка'),
                          content: Text(errorText),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: const Text('Отмена'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            CupertinoDialogAction(
                              child: const Text('ОК'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
              child: AppButton(
                title: 'Войти',
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    AuthEvent.auth(
                      email: controllerEmail.text,
                      password: controllerPassword.text,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 19),
            AppButton(
              title: 'Зарегистрироваться',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.placeholder,
    this.isFirst = true,
  });

  final String placeholder;
  final TextEditingController controller;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        placeholderStyle: AppFonts.placeHolderTextStyle,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.borderColor,
              width: isFirst ? 1 : 0,
            ),
          ),
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CupertinoButton(
          onPressed: onPressed,
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(6.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.50,
            ),
          ),
        ),
      ),
    );
  }
}
