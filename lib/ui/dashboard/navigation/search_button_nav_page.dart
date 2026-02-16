import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/domain/app_colors.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/album_row_widget.dart';

class SearchButtonNavPage extends StatelessWidget {
  List<Map<String, dynamic>> mTopGenresList = [
    {'imgPath': 'assets/images/1st row/1.png', 'name': 'Pop'},

    {'imgPath': 'assets/images/1st row/2.png', 'name': 'Indie'},

    {'imgPath': 'assets/images/1st row/1.png', 'name': 'Pop'},

    {'imgPath': 'assets/images/1st row/2.png', 'name': 'Indie'},
  ];

  List<Map<String, dynamic>> mPodcastList = [
    {'imgPath': 'assets/images/1st row/3.png', 'name': 'News & Politics'},

    {'imgPath': 'assets/images/1st row/4.png', 'name': 'Comedy'},

    {'imgPath': 'assets/images/1st row/3.png', 'name': 'News & Politics'},

    {'imgPath': 'assets/images/1st row/4.png', 'name': 'Comedy'},
  ];

  List<Map<String, dynamic>> mBrowseList = [
    {'imgPath': 'assets/images/1st row/1.png', 'name': '2021 Wrapped'},

    {'imgPath': 'assets/images/1st row/2.png', 'name': 'Podcasts'},

    {'imgPath': 'assets/images/1st row/3.png', 'name': '2021 Wrapped'},

    {'imgPath': 'assets/images/1st row/4.png', 'name': 'Podcasts'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              mSpacer(),
              titleUI(),
              mSpacer(mHeight: 14),
              searchBarUI(),
              mSpacer(mHeight: 14),
              topGenresUI(),
              mSpacer(mHeight: 14),
              popularPodcast(),
              mSpacer(mHeight: 14),
              browseAll(),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Search',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Icon(Icons.camera_alt_outlined, size: 30, color: Colors.white),
        ],
      ),
    );
  }

  Widget searchBarUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        child: TextField(
          cursorColor: AppColors.primaryColor,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Artists, songs, or podcasts',
            hintStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SvgPicture.asset(
                'assets/svg/ic_search.svg',
                width: 25,
                height: 25,
                color: Colors.black,
              ),
              // Icon(Icons.search, size: 30),
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget topGenresUI() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your top genres',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mTopGenresList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 11.0),
                  child: AlbumRowWidget(
                    thumbnailPath: mTopGenresList[index]['imgPath'],
                    albumName: mTopGenresList[index]['name'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget popularPodcast() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular podcast categories',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          mSpacer(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: mPodcastList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 11.0),
                  child: AlbumRowWidget(
                    thumbnailPath: mPodcastList[index]['imgPath'],
                    albumName: mPodcastList[index]['name'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget browseAll() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse All',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          mSpacer(),
          GridView.builder(
            itemCount: mBrowseList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 16 / 9,
              mainAxisSpacing: 11,
              crossAxisSpacing: 11,
            ),
            itemBuilder: (_, index) {
              return AlbumRowWidget(
                thumbnailPath: mBrowseList[index]['imgPath'],
                albumName: mBrowseList[index]['name'],
              );
            },
          ),
        ],
      ),
    );
  }
}
