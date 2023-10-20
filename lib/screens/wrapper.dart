import 'package:eklavya/constants/colors.dart';
import 'package:eklavya/screens/home.dart';
import 'package:eklavya/screens/input.dart';
import 'package:eklavya/screens/portfolio.dart';
import 'package:eklavya/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 1;
  final List<Widget> _screens = [
    const Home(),
    const Portfolio(),
    const Input(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: primaryColor,
          unselectedItemColor: bottomNavColor,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 0 ? primaryColor : bottomNavColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Portfolio',
              icon: SvgPicture.asset(
                'assets/icons/portfolio.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 1 ? primaryColor : bottomNavColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Input',
              icon: SvgPicture.asset(
                'assets/icons/input.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 2 ? primaryColor : bottomNavColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: SvgPicture.asset(
                'assets/icons/profile.svg',
                colorFilter: ColorFilter.mode(
                  _currentIndex == 3 ? primaryColor : bottomNavColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
