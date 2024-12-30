import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_screen/controller/bottom_nav.dart';
import 'package:home_screen/ui/screen/download.dart';
import 'package:home_screen/ui/screen/home.dart';
import 'package:home_screen/ui/screen/profile.dart';
import 'package:home_screen/ui/screen/tv.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final BottomNav navScreenController = Get.put(BottomNav());

  // Screens for the body
  final List<Widget> _screens = [
    Home(),
    const Tv(),
    const Download(),
    const Profile(),
  ];
  // Icons for the navbar
  final List<IconData> _icons = [
    Icons.home,
    Icons.tv,
    Icons.download,
    Icons.person_outline_rounded,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Use GetX for managing the selected screen based on the index
          Obx(() {
            return _screens[navScreenController.selectedIndex.value];
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: _navBar(context), // Pass the context here
          ),
        ],
      ),
    );
  }

  Widget _navBar(BuildContext context) {
    return Container(
      height: 65,
      margin: const EdgeInsets.only(
        right: 24,
        left: 24,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1C212A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the icon width dynamically based on available space
          double iconWidth = constraints.maxWidth / _icons.length;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: _icons.map((icon) {
              int index = _icons.indexOf(icon);

              // Use Obx only for the part that reacts to selectedIndex
              return Obx(() {
                bool isSelected = (navScreenController.selectedIndex.value == index);

                return Material(
                  elevation: 0,
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      // Update the selected index in the controller
                      navScreenController.selectedIndex.value = index;
                    },
                    child: SizedBox(
                      width: iconWidth, // Each icon takes the calculated width
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icon,
                            color: isSelected ? Colors.red : Colors.grey, // Adjust icon color based on selection
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
          );
        },
      ),
    );
  }

}
