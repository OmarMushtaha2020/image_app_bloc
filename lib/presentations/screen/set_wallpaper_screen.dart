
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image_app/bloc_app/wallpaper/bloc.dart';
import 'package:image_app/bloc_app/wallpaper/event.dart';
import 'package:image_app/bloc_app/wallpaper/state.dart';

class SetWallpaperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
String? image=ModalRoute.of(context)?.settings.arguments.toString();
    return BlocProvider(
  create: (context) => WallpaperBloc(),
  child: BlocConsumer<WallpaperBloc, WallpaperState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

          leading: Padding(
            padding: const EdgeInsets.only(bottom: 500,left: 10),

            child: GestureDetector(onTap: () {
              Navigator.pop(context);
            },child: CircleAvatar(backgroundColor: Colors.black,child: Icon(Icons.arrow_back_sharp,color: Colors.white,))),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 600,
          flexibleSpace:
          ClipPath(
            clipper:OvalBottomBorderClipper(),
            child: Container(
              height: 700,
              child: CachedNetworkImage(
                imageUrl: image??"",
                fit: BoxFit.cover,
                placeholder: (context, url) =>Center(child: CircularProgressIndicator(color: Colors.black)),
                errorWidget: (context, url, error) =>Center(child: CircularProgressIndicator(color: Colors.black,) ),
              ),
            ),
          )
      ),
      body:
      Padding(
        padding: const EdgeInsets.only(top: 70,left: 15,right: 15),
        child: GestureDetector(
          onTap: () {
            WallpaperBloc.get(context).add(SetAsWallpaper(image));

          },
          child: Container(
            width: double.infinity,
            height: 50,
            child: Center(
              child: Text("set as Wallpaper",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
            ),
            decoration: BoxDecoration(
              color: Colors.black,

              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),);
  },
),
) ;
  }


}