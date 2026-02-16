import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_rounded_img_card.dart';
import 'package:spotify_clone/ui/dashboard/dashboard_page.dart';
import '../../domain/app_colors.dart';
import '../custom_widgets/my_custom_rounded_btn.dart';

class ChoosePodcastPage extends StatefulWidget {
  const ChoosePodcastPage({super.key});

  @override
  State<ChoosePodcastPage> createState() => _ChoosePodcastPageState();
}

class _ChoosePodcastPageState extends State<ChoosePodcastPage> {
  List<int> selectedArtist = [];

  List<List<Map<String, dynamic>>> mPodcast = [
    [
      {
        "imgPath": "assets/images/Chon.png",
        "name": "Chon",
        "isBlackBg": true,
        "isSpotifyOriginal": false,
      },
      {
        "imgPath": "assets/images/Coastin.png",
        "name": "Coastin",
        "isBlackBg": false,
        "isSpotifyOriginal": true,
      },
      {
        "imgPath": "",
        "name": "More in True Crime",
        "isBlackBg": true,
        "isSpotifyOriginal": true,
      },
    ],
    [
      {
        "imgPath": "assets/images/Anthem of the Peaceful Army.png",
        "name": "Peaceful Army",
        "isBlackBg": true,
        "isSpotifyOriginal": true,
      },
      {
        "imgPath": "assets/images/Bryce Vine.png",
        "name": "Bryce Vine",
        "isBlackBg": true,
        "isSpotifyOriginal": false,
      },
      {
        "imgPath": "",
        "name": "More in Comedy",
        "isBlackBg": false,
        "isSpotifyOriginal": true,
      },
    ],
    [
      {
        "imgPath": "assets/images/Tycho.png",
        "name": " Tycho",
        "isBlackBg": false,
        "isSpotifyOriginal": true,
      },
      {
        "imgPath": "assets/images/Mothership.png",
        "name": "Mothership",
        "isBlackBg": true,
        "isSpotifyOriginal": true,
      },
      {
        "imgPath": "",
        "name": "More in Stories",
        "isBlackBg": true,
        "isSpotifyOriginal": false,
      },
    ],
    [
      {
        "imgPath": "assets/images/Anthem of the Peaceful Army.png",
        "name": "Peaceful Army",
        "isBlackBg": true,
        "isSpotifyOriginal": false,
      },
      {
        "imgPath": "assets/images/Bryce Vine.png",
        "name": "Bryce Vine",
        "isBlackBg": true,
        "isSpotifyOriginal": false,
      },
      {
        "imgPath": "",
        "name": "More in Relationships",
        "isBlackBg": true,
        "isSpotifyOriginal": false,
      },
    ],
    [
      {
        "imgPath": "assets/images/Members 2.png",
        "name": "Members",
        "isBlackBg": true,
        "isSpotifyOriginal": false,
      },
      {
        "imgPath": "assets/images/Afterburner.png",
        "name": "After Burner",
        "isBlackBg": true,
        "isSpotifyOriginal": false,
      },
      {
        "imgPath": "",
        "name": "More in True Crime",
        "isBlackBg": true,
        "isSpotifyOriginal": false,
      },
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  "Now choose some podcasts.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              mSpacer(),

              SizedBox(
                height: 50,
                child: TextField(decoration: getSearchTextFieldDecoration()),
              ),

              mSpacer(mHeight: 21),

              Expanded(
                child: Stack(
                  children: [
                    ListView.builder(
                      itemCount: mPodcast.length,
                      itemBuilder: (_, index) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 11),
                          height: 170,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: mPodcast[index].length,
                            itemBuilder: (_, childIndex) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 11.0),
                                child: Column(
                                  children: [
                                    childIndex == 2
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 11,
                                            ),
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              color:
                                                  Colors.primaries[Random()
                                                      .nextInt(
                                                        Colors
                                                                .primaries
                                                                .length -
                                                            1,
                                                      )],
                                            ),
                                            child: Center(
                                              child: Text(
                                                mPodcast[index][childIndex]['name'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        : MyRoundedImgCard(
                                            mWidth: 120,
                                            mHeight: 120,
                                            imgPath:
                                                mPodcast[index][childIndex]["imgPath"],
                                            isBlackBg:
                                                mPodcast[index][childIndex]['isBlackBg'],
                                            isSpotifyOriginal:
                                                mPodcast[index][childIndex]['isSpotifyOriginal'],
                                          ),

                                    mSpacer(),

                                    Text(
                                      childIndex == 2
                                          ? ""
                                          : mPodcast[index][childIndex]["name"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),

                    // ----> bottom effect
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            stops: [0.05, 0.8],
                            // ----> where to stop first color and second color
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7), //alpha 178
                            ],
                          ),
                        ),
                        child: Center(
                          child: MyCustomRoundedBtn(
                            mWidth: 100,
                            text: "Done",
                            onTap: () {
                              //////// CHANGE IT LATER ---- SharedPreferences /////////
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DashboardPage(),
                                ),
                                (route) => false,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
