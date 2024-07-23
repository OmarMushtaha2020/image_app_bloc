import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_app/bloc_app/home_bloc/bloc.dart';
import 'package:image_app/bloc_app/home_bloc/state.dart';
import 'package:image_app/shared/components/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 1),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/search_screen");

                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
              title: Text(
                "Image App",
                style: TextStyle(color: Colors.black),
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
              ),
            ),
            body: HomeBloc
                  .get(context)
            .imageModel
        ?.hits != null ?
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 5, vertical: 10),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: GridView.count(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(
                      HomeBloc
                          .get(context)
                          .imageModel
                          ?.hits
                          ?.length ??
                          0,
                          (index) =>
                          GestureDetector(
                            onTap: () {
                              pathImage=HomeBloc
                                                .get(context)
                                                .imageModel
                                                ?.hits?[index].largeImageURL ??"";
                              Navigator.pushNamed(context, "/set_wallpaper_screen");



                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${  HomeBloc
                                              .get(context)
                                              .imageModel
                                              ?.hits?[index]
                                              .largeImageURL ?? ""}"),
                                      fit: BoxFit.cover)),
                            ),
                          )),
                ),
              ),
            ) : Center(
             child: CircularProgressIndicator(
               color: Colors.black,
             )
        )





        );



      },
    );
  }
}
