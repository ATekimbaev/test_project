import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_project/core/ui_componets/app_colors.dart';
import 'package:test_project/core/ui_componets/app_fonts.dart';
import 'package:test_project/data/models/user_info_model.dart';
import 'package:test_project/resources/resources.dart';
import 'package:test_project/router/router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.model,
  });
  final UserInfoModel model;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.bgGrey,
      navigationBar: const CupertinoNavigationBar(
        border: null,
        backgroundColor: AppColors.bgWhite,
        middle: Text(
          'Профиль',
          textAlign: TextAlign.center,
          style: AppFonts.w500s15,
        ),
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 38),
            Image.asset(
              AppPngs.profile,
              height: 64,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              model.user?.nickname ?? 'Марипбек Чингиз',
              textAlign: TextAlign.center,
              style: AppFonts.titleText,
            ),
            const SizedBox(height: 12),
            Text(
              model.user?.email ?? 'maripbekoff@gmail.com',
              textAlign: TextAlign.center,
              style: AppFonts.subtitleText,
            ),
            const SizedBox(
              height: 27,
            ),
            GestureDetector(
              onTap: () {
                context.router.push(
                  const LoginRoute(),
                );
              },
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: const BoxDecoration(
                  color: AppColors.bgWhite,
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 29,
                    ),
                    child: Text(
                      'Выйти',
                      style: AppFonts.textButton,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
