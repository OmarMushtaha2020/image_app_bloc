abstract class SearchEvent {}

class InitEvent extends SearchEvent {}
class BringImage extends SearchEvent{
  String ?name;
  BringImage(this.name);
}