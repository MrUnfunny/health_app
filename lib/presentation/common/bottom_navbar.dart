import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../constants/route_paths.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15, top: 15),
      color: ThemeColors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NavItems(
            icon: Icon(
              Icons.dashboard_outlined,
              color: activeTab == 0 ? ThemeColors.black : ThemeColors.grey,
            ),
            onTap: () {
              setState(() {
                activeTab = 0;
              });
            },
          ),
          NavItems(
            isLarge: true,
            icon: Icon(
              Icons.add,
              color: ThemeColors.backgroundColor,
            ),
            onTap: () {
              setState(() {
                activeTab = 1;
              });
              Navigator.pushNamed(context, RoutePaths.formDetail);
            },
          ),
          NavItems(
            icon: Icon(
              Icons.settings,
              color: activeTab == 2 ? ThemeColors.black : ThemeColors.grey,
            ),
            onTap: () {
              setState(() {
                activeTab = 2;
              });
            },
          ),
        ],
      ),
    );
  }
}

class NavItems extends StatelessWidget {
  final Icon icon;
  final void Function() onTap;
  final bool isLarge;
  const NavItems({
    Key? key,
    required this.icon,
    required this.onTap,
    this.isLarge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: icon,
        height: 60,
        width: 60,
        decoration: isLarge
            ? BoxDecoration(
                color: ThemeColors.mainColor,
                borderRadius: BorderRadius.circular(50),
              )
            : null,
      ),
    );
  }
}
