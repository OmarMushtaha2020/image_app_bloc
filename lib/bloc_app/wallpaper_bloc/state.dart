abstract class WallpaperState {

}
class InitialState extends WallpaperState{}
class SetAsWallpaperSuccessfully extends WallpaperState{}
class   SetAsWallpaperFailed  extends WallpaperState{
  String ?error;
  SetAsWallpaperFailed(this.error);
}


