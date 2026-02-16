import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/domain/app_colors.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import 'package:spotify_clone/ui/custom_widgets/my_custom_rounded_btn.dart';
import '../../domain/app_routes.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int selectedIndex = 0;

  List<Widget> allPages = [];

  bool isPP1Selected = false; // ----> radio 1
  bool isPP2Selected = false; // ----> radio 2

  @override
  void initState() {
    super.initState();
    allPages = [stepOneUi(), stepTwoUi(), stepThreeUi(), stepFourUi()];
  } // ----> logic ends here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        centerTitle: true,
        title: Text(
          "Create account",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            if (selectedIndex > 0) {
              selectedIndex--;
              setState(() {});
            } else {
              Navigator.pop(context);
            }
          }, // ----> logic ends here
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset("assets/svg/Left.svg", color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            allPages[selectedIndex], // ----> connected all pages
            mSpacer(mHeight: 21),
            Padding(
              padding: EdgeInsets.only(bottom: selectedIndex < 3 ? 0 : 43),
              child: MyCustomRoundedBtn(
                mWidth: selectedIndex < 3 ? 100 : 180,
                // ----> logic here
                text: selectedIndex < 3 ? "Next" : "Create an Account",
                // ----> logic here
                onTap: () {
                  if (selectedIndex < 3) {
                    selectedIndex++;
                    setState(() {});
                  } else {
                    // ----> next screen
                    Navigator.pushNamed(context, AppRoutes.choose_artist_page);
                  }
                }, // ----> logic ends here
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stepOneUi() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'What\'s your email?',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),
      TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: getCreateAccTextFieldDecoration(),
      ),
      mSpacer(mHeight: 7),
      Text(
        'You\'ll need to confirm this email later.',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );

  Widget stepTwoUi() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Create a password',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),
      TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: getCreateAccTextFieldDecoration(),
      ),
      mSpacer(mHeight: 7),
      Text(
        'Use atleast 8 characters.',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  );

  Widget stepThreeUi() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'What’s your gender?',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      ),

      mSpacer(),

      Wrap(
        runAlignment: WrapAlignment.spaceEvenly,
        runSpacing: 11,
        spacing: 11,
        children: [
          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 40,
            isOutlined: true,
            textColor: Colors.white,
            text: "Male",
            bgColor: AppColors.primaryColor,
            onTap: () {},
          ),

          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 40,
            isOutlined: true,
            textColor: Colors.white,
            text: "Female",
            bgColor: AppColors.primaryColor,
            onTap: () {},
          ),

          MyCustomRoundedBtn(
            mWidth: 150,
            mHeight: 40,
            isOutlined: true,
            textColor: Colors.white,
            text: "not prefer to say",
            bgColor: AppColors.primaryColor,
            onTap: () {},
          ),

          MyCustomRoundedBtn(
            mWidth: 100,
            mHeight: 40,
            isOutlined: true,
            textColor: Colors.white,
            text: "Other",
            bgColor: AppColors.primaryColor,
            onTap: () {},
          ),
        ],
      ),
    ],
  );

  Widget stepFourUi() => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What\'s your name?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          textAlign: TextAlign.center,
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: getCreateAccTextFieldDecoration(),
        ),
        mSpacer(mHeight: 7),
        Text(
          'This appears on your spotify profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
          textAlign: TextAlign.center,
        ),

        mSpacer(mHeight: 21),

        Divider(color: AppColors.greyColor, height: 1),

        mSpacer(mHeight: 21),

        Text(
          'By tapping on "Create account", you agree to the spotify\'s Terms of Use.',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),

        mSpacer(mHeight: 21),

        Text(
          'Terms of Use',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),

        mSpacer(mHeight: 21),

        Text(
          'To learn more about how Spotify collect, uses, shares and protects your personal data, Please see the Spotify Privacy Policy.',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),

        mSpacer(mHeight: 21),

        Text(
          'Privacy Policy',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),

        mSpacer(mHeight: 21),

        RadioListTile.adaptive(
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(
            'Please send me news and offers from Spotify.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          value: isPP1Selected,
          groupValue: false,
          onChanged: (value) {
            isPP1Selected = value!;
            setState(() {});
          },
        ),

        mSpacer(mHeight: 21),

        RadioListTile.adaptive(
          controlAffinity: ListTileControlAffinity.trailing,
          title: Text(
            'Share my registration data with Spotify’s content providers for marketing purposes.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          value: isPP2Selected,
          groupValue: false,
          onChanged: (value) {
            isPP2Selected = value!;
            setState(() {});
          },
        ),
      ],
    ),
  );
}
