abstract class SearchState {

}
class InitialState extends SearchState{}

class BringImageSuccessfully extends SearchState{}
class BringImageFailed extends SearchState{
  String ?error;
  BringImageFailed(this.error);
}
