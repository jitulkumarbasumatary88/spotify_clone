import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/ui/create_account/create_account_page.dart';
import 'package:spotify_clone/ui/dashboard/dashboard_page.dart';
import 'package:spotify_clone/ui/dashboard/navigation/library/library_button_nav_page.dart';
import 'package:spotify_clone/ui/dashboard/navigation/library/settings_nav_page.dart';
import '../ui/dashboard/navigation/library/my_profile_nav_page.dart';
import '../ui/intro/choose_artist_page.dart';
import '../ui/intro/choose_podcast_page.dart';
import '../ui/intro/intro_page.dart';
import '../ui/splash/splash_page.dart';

class AppRoutes {
  static const String splash_page = '/splash';
  static const String intro_page = '/intro';
  static const String create_account_page = '/create_page';
  static const String choose_artist_page = '/choose_artist';
  static const String choose_podcast_page = '/create_podcast';
  static const String dashboard_page = '/dashboard_page';
  static const String my_profile_nav_page = '/my_profile_nav_page';
  static const String settings_nav_page = '/settings_nav_page';

  static Map<String, Widget Function(BuildContext)> getRoutes() => {
    splash_page: (context) => SplashPage(),
    intro_page: (context) => IntroPage(),
    create_account_page: (context) => CreateAccountPage(),
    choose_artist_page: (context) => ChooseArtistPage(),
    choose_podcast_page: (context) => ChoosePodcastPage(),
    dashboard_page: (context) => DashboardPage(),
    my_profile_nav_page: (context) => MyProfileNavPage(),
    settings_nav_page: (context) => SettingsNavPage(),
  };
}
