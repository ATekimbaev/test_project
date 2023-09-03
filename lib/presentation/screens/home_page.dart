import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/core/ui_componets/app_colors.dart';
import 'package:test_project/data/models/user_info_model.dart';
import 'package:test_project/presentation/screens/profile_screen.dart';
import 'package:test_project/resources/resources.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    this.model,
  });
  final UserInfoModel? model;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 3;
  String currentLable = 'Профиль';
  List<BottomNavBarItemModel> items = [
    BottomNavBarItemModel(
      lable: 'Лента',
      svg: AppSvgs.band,
    ),
    BottomNavBarItemModel(
      lable: 'Карта',
      svg: AppSvgs.map,
    ),
    BottomNavBarItemModel(
      lable: 'Избранные',
      svg: AppSvgs.favorites,
    ),
    BottomNavBarItemModel(
      lable: 'Профиль',
      svg: AppSvgs.profile,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          onTap: (index) {
            currentIndex = index;
            currentLable = items[index].lable;
            setState(() {});
          },
          currentIndex: 3,
          backgroundColor: AppColors.bgWhite,
          activeColor: AppColors.blue,
          inactiveColor: AppColors.black,
          items: items
              .map(
                (e) => BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    e.svg,
                    colorFilter: ColorFilter.mode(
                      e.lable == currentLable
                          ? AppColors.blue
                          : AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: e.lable,
                ),
              )
              .toList()),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return Center(
              child: Text(
                'Tab $index',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            );
          case 1:
            return Center(
              child: Text(
                'Tab $index',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            );
          case 2:
            return Center(
              child: Text(
                'Tab $index',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
            );
          case 3:
            return ProfileScreen(
              model: widget.model ?? UserInfoModel(),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class BottomNavBarItemModel {
  String lable;
  String svg;
  BottomNavBarItemModel({
    required this.lable,
    required this.svg,
  });
}
