import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify_clone/domain/app_colors.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/dashboard/navigation/home_button_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigation/library/library_button_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigation/library/my_profile_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigation/library/settings_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigation/search_button_nav_page.dart';
import '../custom_widgets/my_compact_music_player_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PaletteGenerator? paletteGenerator;

  double currentValue = 34;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    initializedPaletteGenerator();
  }

  initializedPaletteGenerator() async {
    paletteGenerator = await getColorPalette('assets/images/1st row/1.png');
  }

  int selectedBottomIndex = 0;
  List<Widget> mBottomNavPages = [
    HomeButtonNavPage(),
    SearchButtonNavPage(),
    LibraryButtonNavPage(),
    // MyProfileNavPage(profilePicPath: 'assets/png/ic_user.png'),
    // SettingsNavPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 65.0),
            child: mBottomNavPages[selectedBottomIndex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                /// bottom sheet
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (_) {
                    return Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.16, 1.0],
                          colors: [
                            HSLColor.fromColor(
                              paletteGenerator!.dominantColor!.color,
                            ).withLightness(0.34).toColor(),
                            Colors.black87, // ----> le me check letter 87
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              mSpacer(mHeight: 34),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      child: SvgPicture.asset(
                                        'assets/svg/ic_down.svg',
                                        width: 20,
                                        height: 20,
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Text(
                                      '1(Remastered)',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.more_horiz, color: Colors.white),
                                  ],
                                ),
                              ),
                              mSpacer(mHeight: 16),
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: Image.asset(
                                    'assets/images/1st row/1.png',
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      'From Me to You - Mono / Remastered',
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                    subtitle: Text('The Beatles'),
                                    titleTextStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.fade,
                                    ),
                                    subtitleTextStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    trailing: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 26,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                    ),
                                    child: StatefulBuilder(
                                      builder: (_, ss) {
                                        return SliderTheme(
                                          data: SliderThemeData(
                                            overlayShape:
                                                SliderComponentShape.noOverlay,
                                          ),
                                          child: Slider(
                                            activeColor: Colors.white,
                                            thumbColor: Colors.white,
                                            inactiveColor: Colors.grey,
                                            min: 0,
                                            max: 100,
                                            autofocus: true,
                                            value: currentValue,
                                            onChanged: (value) {
                                              currentValue = value;
                                              ss(() {});
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '0.38',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70,
                                          ),
                                        ),
                                        Text(
                                          '-1.18',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/svg/ic_shuffle.svg',
                                          width: 25,
                                          height: 25,
                                        ),
                                        Icon(
                                          Icons.skip_previous_sharp,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        StatefulBuilder(
                                          builder: (context, ss) {
                                            return InkWell(
                                              onTap: () {
                                                isPlaying = !isPlaying;
                                                ss(() {});
                                              },
                                              child: Icon(
                                                isPlaying
                                                    ? Icons
                                                          .pause_circle_filled_sharp
                                                    : Icons
                                                          .play_circle_filled_sharp,
                                                color: Colors.white,
                                                size: 77,
                                              ),
                                            );
                                          },
                                        ),
                                        Icon(
                                          Icons.skip_next_sharp,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                        SvgPicture.asset(
                                          'assets/svg/ic_repeat.svg',
                                          width: 25,
                                          height: 25,
                                          color: AppColors.primaryColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        mSpacer(),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.bluetooth,
                                              color: Colors.green,
                                              size: 14,
                                            ),
                                            Text(
                                              'BEATS PILL+',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        SvgPicture.asset(
                                          'assets/svg/ic_share.svg',
                                          width: 20,
                                          height: 20,
                                        ),
                                        mSpacer(mWidth: 25),
                                        Icon(
                                          Icons.playlist_play_sharp,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.all(11),
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffD8672A),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(7),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lyrics',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 7),
                                    width: 88,
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'MORE',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          'assets/svg/ic_more.svg',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: MyCompactMusicPlayerWidget(
                songTitle: 'From Me to You - Mono / Remastered',
                albumTitle: 'The Beatles',
                thumbnailPath: 'assets/images/1st row/1.png',
                isBluetooth: true,
                bluetoothName: 'BEATS PILL+',
                bgColor: Color(0xff550a1C),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.blackColor,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 11,
        currentIndex: selectedBottomIndex,
        iconSize: 11,
        selectedLabelStyle: TextStyle(color: AppColors.whiteColor),
        unselectedLabelStyle: TextStyle(color: AppColors.greyColor),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.greyColor,
        backgroundColor: AppColors.blackColor,
        onTap: (value) {
          selectedBottomIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png/Home_outline.png',
              width: 20,
              height: 20,
              color: Colors.grey,
            ),
            label: "Home",
            activeIcon: Image.asset(
              'assets/png/Home_Solid.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png/Search_Solid.png',
              width: 20,
              height: 20,
              color: Colors.grey,
            ),
            label: "Search",
            activeIcon: Image.asset(
              'assets/png/Search_Solid.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),

          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/png/Library_Solid.png',
              width: 20,
              height: 20,
              color: Colors.grey,
            ),
            label: "Library",
            activeIcon: Image.asset(
              'assets/png/Library_Solid.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
