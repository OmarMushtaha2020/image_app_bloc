import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:image_app/bloc_app/home_bloc/event.dart';
import 'package:image_app/data/model/image_model.dart';
import 'event.dart';
import 'state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(InitialState());
  static SearchBloc get(context) => BlocProvider.of(context);

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is BringImage) {
       yield* bringImagesByName(event.name!);
    }
  }
  ImageModel?  searchModel;

  Stream<SearchState> bringImagesByName(String name)async*{
    try {
      var url="https://pixabay.com/api/?key=27603626-a8f0e0309584dcbe49b80be6c&q=$name&image_type=photo";
      var response=await http.get(Uri.parse(url));
      var jsonResponse=await convert.jsonDecode(response.body);
      searchModel= ImageModel.fromJson(jsonResponse);
      yield BringImageSuccessfully();
    }catch (error) {
      yield BringImageFailed(error.toString());

    }


  }
}
