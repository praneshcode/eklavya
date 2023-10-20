import 'package:eklavya/constants/colors.dart';
import 'package:eklavya/models/details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  List<DetailsCard> list = [
    DetailsCard(title: 'Kemampuan Merangkum  Tulisan 1', image: 'image1'),
    DetailsCard(title: 'Kemampuan Merangkum  Tulisan 2', image: 'image2'),
    DetailsCard(title: 'Kemampuan Merangkum  Tulisan 3', image: 'image3'),
    DetailsCard(title: 'Kemampuan Merangkum  Tulisan 4', image: 'image4'),
    DetailsCard(title: 'Kemampuan Merangkum  Tulisan 5', image: 'image1'),
  ];
  List<DetailsCard> searchList = [];

  @override
  void initState() {
    super.initState();

    searchList = list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: borderColor),
            ),
            child: Row(
              children: [
                SizedBox(width: 16.w),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchList = getDetailsCardsByKeyword(list, value);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search a project',
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: lightTextColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: primaryColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          if (searchList.isNotEmpty)
            Expanded(
              child: ListView.separated(
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  return detailsCard(
                    title: searchList[index].title,
                    image: searchList[index].image,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
              ),
            )
          else
            Center(
              child: Text(
                'No matching results found',
                style: TextStyle(
                  color: lightTextColor,
                  fontSize: 16.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget detailsCard({required String title, required String image}) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/$image.png',
            fit: BoxFit.cover,
            width: 110.w,
            height: 110.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: darkTextColor,
                      fontSize: 14.sp,
                      height: 1.29.h,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BAHASA SUNDA',
                            style: TextStyle(
                              color: darkTextColor,
                              fontSize: 10.sp,
                              height: 1.2.h,
                            ),
                          ),
                          Wrap(
                            children: [
                              Text(
                                'Oleh ',
                                style: TextStyle(
                                  color: lightTextColor,
                                  fontSize: 10.sp,
                                  height: 1.2.h,
                                ),
                              ),
                              Text(
                                'Al-Baiqi Samaan',
                                style: TextStyle(
                                  color: lightTextColor,
                                  fontSize: 10.sp,
                                  height: 1.2.h,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 50.w,
                        height: 26.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFFF39519),
                              Color(0xFFFFCD67),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'A',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              height: 1.14.h,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<DetailsCard> getDetailsCardsByKeyword(
    List<DetailsCard> list,
    String keyword,
  ) {
    if (keyword.isEmpty) {
      return list;
    }

    List<DetailsCard> searchList = [];
    for (DetailsCard detailsCard in list) {
      if (detailsCard.title.toLowerCase().contains(keyword.toLowerCase())) {
        searchList.add(detailsCard);
      }
    }

    return searchList;
  }
}
