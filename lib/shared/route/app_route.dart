
import 'package:flutter/material.dart';
import 'package:image_app/presentations/screen/home_screen.dart';
import 'package:image_app/presentations/screen/search_screen.dart';
import 'package:image_app/presentations/screen/set_wallpaper_screen.dart';
import 'package:image_app/shared/components/constants.dart';


class AppRoute{
  Route?generateRoute(RouteSettings settings){
    switch(settings.name){
      case "/home_screen":
        return  MaterialPageRoute(builder: (_)=>HomeScreen());
      case "/search_screen":
        return  MaterialPageRoute(builder: (_)=>SearchScreen());

      case "/set_wallpaper_screen":
        return  MaterialPageRoute(builder: (_)=>SetWallpaperScreen(),settings: RouteSettings(arguments: pathImage));
      default:
        return  MaterialPageRoute(builder: (_)=>HomeScreen());
    }
  }
}