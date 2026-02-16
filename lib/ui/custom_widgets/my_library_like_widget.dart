import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/ui_helper.dart';

class MyLibraryLikeWidget extends StatelessWidget {
  bool isLeadingGradient;
  List<Color>? mGradientColors;
  Color? mSolidColor;
  IconData mLeadingIcon;
  Color mLeadingIconColor;
  String mTitle;
  String mSubTitle;

  MyLibraryLikeWidget({
    required this.mTitle,
    required this.mSubTitle,
    this.mLeadingIconColor = Colors.white,
    this.mLeadingIcon = Icons.favorite,
    this.mSolidColor,
    this.isLeadingGradient = false,
    this.mGradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          color: mSolidColor ?? Color(0xff5E3B7A),
          gradient: isLeadingGradient
              ? LinearGradient(
                  colors:
                      mGradientColors ??
                      [Color(0xff4A39EA), Color(0xff868AE1), Color(0xffB9d4DB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Icon(mLeadingIcon, color: mLeadingIconColor),
      ),
      title: Text(mTitle),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      subtitle: Row(
        children: [
          SvgPicture.asset('assets/svg/ic_pin.svg'),
          mSpacer(mWidth: 4),
          Text(mSubTitle),
        ],
      ),
      subtitleTextStyle: TextStyle(color: Colors.grey, fontSize: 16),
    );
  }
}
