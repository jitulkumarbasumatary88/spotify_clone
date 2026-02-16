import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spotify_clone/domain/app_colors.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/dashboard/navigation/library/settings_nav_page.dart';

import '../../../../domain/app_routes.dart';

class MyProfileNavPage extends StatefulWidget {
  String profilePicPath;

  MyProfileNavPage({this.profilePicPath = 'assets/png/ic_user.png'});

  @override
  State<MyProfileNavPage> createState() => _MyProfileNavPageState();
}

class _MyProfileNavPageState extends State<MyProfileNavPage> {
  List<Map<String, dynamic>> mPlaylists = [
    {
      'title': 'Shazam',
      'likes': 7,
      'thumbGroup': [
        'assets/images/1st row/1.png',
        'assets/images/1st row/2.png',
        'assets/images/1st row/3.png',
        'assets/images/1st row/4.png',
      ],
    },

    {
      'title': 'Roadtrip',
      'likes': 11,
      'thumbGroup': [
        'assets/images/3rd row/1.png',
        'assets/images/1st row/2.png',
        'assets/images/3rd row/3.png',
        'assets/images/4th row/1.png',
      ],
    },

    {
      'title': 'Study',
      'likes': 4,
      'thumbGroup': [
        'assets/images/3rd row/1.png',
        'assets/images/3rd row/2.png',
        'assets/images/4th row/2.png',
        'assets/images/4th row/3.png',
      ],
    },
  ];

  List<String> playlistThumbnailPath = [
    'assets/images/1st row/1.png',
    'assets/images/1st row/2.png',
    'assets/images/1st row/3.png',
    'assets/images/1st row/4.png',
  ];

  PaletteGenerator? paletteGenerator;

  @override
  void initState() {
    super.initState();
    initializePaletteGenerator();
  }

  void initializePaletteGenerator() async {
    paletteGenerator = await getColorPalette(widget.profilePicPath);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  paletteGenerator != null
                      ? HSLColor.fromColor(
                          paletteGenerator!.colors.toList()[2],
                        ).withLightness(0.25).toColor()
                      : Colors.black,
                  Colors.black,
                ],
                stops: [0, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mSpacer(mHeight: 70),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.settings_nav_page,
                          );
                        },
                        child: Icon(Icons.more_horiz, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.profilePicPath),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryBlackColor,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child: Text('Edit Profile'),
                ),
                mSpacer(mHeight: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '23',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'PLAYLISTS',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '58',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'FOLLOWERS',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '43',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'FOLLOWING',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                mSpacer(mHeight: 16),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Playlists',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  mSpacer(),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mPlaylists.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: SizedBox(
                          width: 56,
                          height: 56,
                          child: Wrap(
                            children:
                                (mPlaylists[index]['thumbGroup']
                                        as List<String>)
                                    .map(
                                      (eachImg) => Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(eachImg),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                        ),
                        title: Text(
                          '${mPlaylists[index]['title']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${mPlaylists[index]['likes']}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right_sharp,
                          color: Colors.grey,
                          size: 30,
                        ),
                      );
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'See all playlists',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right_sharp,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
