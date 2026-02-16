import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'app_colors.dart';

Widget mSpacer({double mWidth = 11, double mHeight = 11}) =>
    SizedBox(width: mWidth, height: mHeight);

InputDecoration getCreateAccTextFieldDecoration() => InputDecoration(
  filled: true,
  fillColor: AppColors.greyColor,
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(11),
    borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
  ),
);

InputDecoration getSearchTextFieldDecoration({
  IconData mIcon = Icons.search,
  Color bgColor = Colors.white,
  String mText = "Search",
}) => InputDecoration(
  contentPadding: EdgeInsets.zero,
  filled: true,
  fillColor: bgColor,
  hintText: mText,
  prefixIcon: Icon(mIcon),
  hintStyle: TextStyle(color: AppColors.secondaryBlackColor),
  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(11)),
);

Future<PaletteGenerator> getColorPalette(String imgPath) async {
  return await PaletteGenerator.fromImageProvider(
      AssetImage(imgPath));
}
