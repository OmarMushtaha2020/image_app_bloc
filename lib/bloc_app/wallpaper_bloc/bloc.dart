import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

import 'event.dart';
import 'state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  WallpaperBloc() : super(InitialState());
  static WallpaperBloc get(context) => BlocProvider.of(context);

  @override
  Stream<WallpaperState> mapEventToState(WallpaperEvent event) async* {
    if (event is SetAsWallpaper) {
      yield* _mapImageWallpaperManager(event.pathImage??"");
    }
  }

  Stream<WallpaperState> _mapImageWallpaperManager(String image) async* {
    try{
      await imageWallpaperManager(image);
      yield SetAsWallpaperSuccessfully();
    }catch(error){
      yield SetAsWallpaperFailed(error.toString());

    }


  }
 Future<void> imageWallpaperManager(String image) async {
     int location = WallpaperManager.LOCK_SCREEN; //can be Home/Lo
     int locations = WallpaperManager.HOME_SCREEN; //can be Home/Lo

     var files = await DefaultCacheManager().getSingleFile(image); // ck Screen
     bool result =
         await WallpaperManager.setWallpaperFromFile(files.path, location); //
     bool results =
         await WallpaperManager.setWallpaperFromFile(files.path, locations); //

 }
}
