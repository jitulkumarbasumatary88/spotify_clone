import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_circular_img_bg.dart';
import '../../domain/app_colors.dart';
import '../../domain/app_routes.dart';
import '../custom_widgets/my_custom_rounded_btn.dart';

class ChooseArtistPage extends StatefulWidget {
  @override
  State<ChooseArtistPage> createState() => _ChooseArtistPageState();
}

class _ChooseArtistPageState extends State<ChooseArtistPage> {
  List<int> selectedArtist = [];

  List<Map<String, dynamic>> mArtists = [
    {"imgPath": "assets/images/Members 2.png", "name": "Members"},
    {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
    {
      "imgPath": "assets/images/Anthem of the Peaceful Army.png",
      "name": "Peaceful Army",
    },
    {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},

    {
      "imgPath": "assets/images/Dance Gavin Dance - Members.png",
      "name": " Members",
    },
    {"imgPath": "assets/images/MGK.png", "name": "MGK"},

    {"imgPath": "assets/images/Members 2.png", "name": "Members"},
    {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
    {
      "imgPath": "assets/images/Anthem of the Peaceful Army.png",
      "name": "Peaceful Army",
    },
    {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
    {"imgPath": "assets/images/Members 2.png", "name": "Members"},
    {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
    {
      "imgPath": "assets/images/Anthem of the Peaceful Army.png",
      "name": "Peaceful Army",
    },
    {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
    {"imgPath": "assets/images/Members 2.png", "name": "Members"},
    {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
    {
      "imgPath": "assets/images/Anthem of the Peaceful Army.png",
      "name": "Peaceful Army",
    },
    {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
    {"imgPath": "assets/images/Members 2.png", "name": "Members"},
    {"imgPath": "assets/images/Afterburner.png", "name": "After Burner"},
    {
      "imgPath": "assets/images/Anthem of the Peaceful Army.png",
      "name": "Peaceful Army",
    },
    {"imgPath": "assets/images/Bryce Vine.png", "name": "Bryce Vine"},
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
                  "Choose 3 or more artists you like.",
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
                    GridView.builder(
                      itemCount: mArtists.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 11,
                        crossAxisSpacing: 11,
                        childAspectRatio: 9 / 10,
                      ),
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {
                            if (!selectedArtist.contains(index)) {
                              selectedArtist.add(index);
                              setState(() {});
                            } else {
                              selectedArtist.remove(index);
                              setState(() {});
                            }
                          },
                          child: Column(
                            children: [
                              MyCircularImgBg(
                                imgPath: mArtists[index]["imgPath"],
                                isSelected: selectedArtist.contains(index),
                              ),

                              mSpacer(),

                              Text(
                                mArtists[index]["name"],
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
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                        child: selectedArtist.length >= 3
                            ? Center(
                                child: MyCustomRoundedBtn(
                                  mWidth: 100,
                                  text: "Next",
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.choose_podcast_page,
                                    );
                                  },
                                ),
                              )
                            : Container(),
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
