import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/app_colors.dart';
import 'package:spotify_clone/domain/app_routes.dart';
import 'package:spotify_clone/ui/custom_widgets/my_library_like_widget.dart';
import 'package:spotify_clone/ui/custom_widgets/type_chip_widget.dart';
import '../../../../domain/ui_helper.dart';

class LibraryButtonNavPage extends StatelessWidget {
  List<String> mTypes = ['PlayLists', 'Artists', 'Albums', 'Podcasts & shows'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Column(
          children: [
            mSpacer(),
            titleUI(context),
            mSpacer(),
            typeChipUI(),
            mSpacer(mHeight: 16),
            recentlyPlayedUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    mSpacer(mWidth: 16),
                    MyLibraryLikeWidget(
                      isLeadingGradient: true,
                      mGradientColors: [
                        Color(0xff4A39EA),
                        Color(0xff868AE1),
                        Color(0xffB9d4DB),
                      ],
                      mTitle: 'Liked Songs',
                      mSubTitle: 'Playlist | 58 songs',
                    ),
                    mSpacer(mHeight: 5),
                    MyLibraryLikeWidget(
                      mTitle: 'New Episodes',
                      mSubTitle: 'Updated 2 days ago',
                      mSolidColor: Color(0xff5E3B7A),
                      mLeadingIcon: Icons.notifications_active,
                      mLeadingIconColor: Colors.green,
                    ),
                    mSpacer(),
                    ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Image.asset(
                                'assets/images/1st row/3.png',
                                width: 60,
                                height: 60,
                              ),
                              title: Text('Lolo Zouai'),
                              titleTextStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              subtitle: Text('Artist'),
                              subtitleTextStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                            mSpacer(mHeight: 14),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleUI(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.asset('assets/png/ic_user.png', width: 50, height: 50),
          ),
          mSpacer(),
          Text(
            'Your Library',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.my_profile_nav_page);
            },
            child: Icon(Icons.add, size: 35, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget typeChipUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          itemCount: mTypes.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TypeChipWidget(typeName: mTypes[index]);
          },
        ),
      ),
    );
  }

  Widget recentlyPlayedUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Icon(
              Icons.compare_arrows_rounded,
              color: Colors.white,
              size: 16,
            ),
          ),
          mSpacer(mWidth: 2),
          Text(
            'Recently Played',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          SvgPicture.asset('assets/svg/Component 17.svg', color: Colors.white),
        ],
      ),
    );
  }
}
