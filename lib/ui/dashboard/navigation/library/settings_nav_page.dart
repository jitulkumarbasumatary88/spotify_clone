import 'package:flutter/material.dart';
import 'package:spotify_clone/domain/ui_helper.dart';
import '../../../../domain/app_colors.dart';

class SettingsNavPage extends StatelessWidget {
  List<String> mSettingList = [
    'Account',
    'Data Saver',
    'Data Saver',
    'Languages',
    'Playback',
    'Explicit Content',
    'Devices',
    'Car',
    'Social',
    'Voice Assistant & Apps',
    'Audio Quality',
    'Storage',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
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
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// i don't know
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          mSpacer(),
          ListTile(
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/png/ic_user.png'),
                ),
              ),
            ),
            title: Text(
              'maya',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'View Profile',
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Icon(
              Icons.chevron_right_sharp,
              color: Colors.grey,
              size: 30,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mSettingList.length,
              itemBuilder: (_, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    mSettingList[index],
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  trailing: Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.grey,
                    size: 30,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
