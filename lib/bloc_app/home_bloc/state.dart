abstract class HomeState {}

class InitialState extends HomeState{}
class GetAllImagesSucceed extends HomeState{}
class GetAllImagesFailed extends HomeState{
  String ?error;
  GetAllImagesFailed(this.error);
}