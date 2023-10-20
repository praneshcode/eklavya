import 'package:eklavya/constants/colors.dart';
import 'package:eklavya/screens/tabs/achievement.dart';
import 'package:eklavya/screens/tabs/project.dart';
import 'package:eklavya/screens/tabs/saved.dart';
import 'package:eklavya/screens/tabs/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final List<Tab> tabs = [
    const Tab(text: 'Project'),
    const Tab(text: 'Saved'),
    const Tab(text: 'Shared '),
    const Tab(text: 'Achievment'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Portfolio',
            style: TextStyle(
              fontSize: 18.sp,
              color: darkTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/shopping_bag.svg',
                width: 24.w,
                height: 24.h,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/notification.svg',
                width: 24.w,
                height: 24.h,
              ),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: primaryColor,
            labelColor: primaryColor,
            unselectedLabelColor: darkTextColor,
            labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(fontSize: 14.sp),
            labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
            tabs: const [
              Tab(text: 'Project'),
              Tab(text: 'Saved'),
              Tab(text: 'Shared'),
              Tab(text: 'Achievement'),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: 104.w,
          height: 43.h,
          child: FloatingActionButton(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.w),
            ),
            elevation: 8,
            highlightElevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/filter.svg',
                  width: 18.w,
                  height: 12.h,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
        body: const TabBarView(
          children: [
            Project(),
            Saved(),
            Shared(),
            Achievement(),
          ],
        ),
      ),
    );
  }
}
