import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/widget/home_screen_app_bar.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/categories_tab.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/favourite_screen.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/presentation/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home/presentation/home_tab.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const CategoriesTab(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      extendBody: false,
      body: tabs[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomNavigationBar(
              currentIndex: currentIndex,
              bubbleCurve: Curves.fastEaseInToSlowEaseOut,
              scaleCurve: Curves.fastEaseInToSlowEaseOut,
              borderRadius: Radius.circular(26),
              isFloating: true,
              iconSize: 29,
              selectedColor: Colors.black,
              unSelectedColor: Colors.white,
              backgroundColor: Color(0xff8E6CEF),
              onTap: (value) => changeSelectedIndex(value),
              // backgroundColor: ColorManager.primary,
              // type: BottomNavigationBarType.fixed,
              // selectedItemColor: ColorManager.primary,
              // unselectedItemColor: ColorManager.white,
              // showSelectedLabels: false, // Hide selected item labels
              // showUnselectedLabels: false, // Hide unselected item labels
              items: [
                // Build BottomNavigationBarItem widgets for each tab
                CustomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    title: const Text(
                      "Home",
                      style: TextStyle(color: Colors.black),
                    )),
                CustomNavigationBarItem(
                    icon: const Icon(FontAwesomeIcons.list),
                    title: const Text("Category", style: TextStyle(color: Colors.black))),
                CustomNavigationBarItem(
                    icon: const Icon(FontAwesomeIcons.heart),
                    title: const Text("Favourite", style: TextStyle(color: Colors.black))),
                CustomNavigationBarItem(
                    icon: const Icon(FontAwesomeIcons.user),
                    title: const Text("Profile", style: TextStyle(color: Colors.black))),
                // CustomNavigationBarItem(IconsAssets.icCategory, "Category"),
                // CustomNavigationBarItem(IconsAssets.icWithList, "WishList"),
                // CustomNavigationBarItem(IconsAssets.icProfile, "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  changeSelectedIndex(int selectedIndex) {
    setState(() {
      currentIndex = selectedIndex;
    });
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;

  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
          label: title,
          icon: ImageIcon(
            AssetImage(iconPath), // Inactive icon image
            color: ColorManager.white, // Inactive icon color
          ),
          activeIcon: CircleAvatar(
            backgroundColor: ColorManager.white, // Background of active icon
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager
                  .primary, // Active icon imagecolor: ColorManager.primary, // Active icon color
            ),
          ),
        );
}
