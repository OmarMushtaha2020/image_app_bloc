import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_app/data/model/image_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'event.dart';
import 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialState());

  static HomeBloc get(context) => BlocProvider.of(context);

  ImageModel? imageModel;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetAllImages) {
      yield* _mapGetAllImage();
    }
  }

  Stream<HomeState> _mapGetAllImage() async* {
    try {
      await getAllImage();
      yield GetAllImagesSucceed();
    } catch (error) {
      yield GetAllImagesFailed(error.toString());
    }
  }

  Future<void> getAllImage() async {
    var url = "https://pixabay.com/api/?key=27603626-a8f0e0309584dcbe49b80be6c&q=yellow+flowers&image_type=photo";
    var response = await http.get(Uri.parse(url));

    var jsonResponse = convert.jsonDecode(response.body);
    imageModel = ImageModel.fromJson(jsonResponse);
    print("ysuyd${imageModel?.hits?[0].pageURL}");
  }
}
