abstract class WallpaperEvent {}

class InitEvent extends WallpaperEvent {}
class SetAsWallpaper extends WallpaperEvent{
  String ?pathImage;
  SetAsWallpaper(this.pathImage);
}