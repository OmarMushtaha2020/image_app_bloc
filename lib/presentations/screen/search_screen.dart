import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_app/bloc_app/search_bloc/bloc.dart';
import 'package:image_app/bloc_app/search_bloc/event.dart';
import 'package:image_app/bloc_app/search_bloc/state.dart';
import 'package:image_app/shared/components/constants.dart';


class SearchScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SearchBloc(),
  child: BlocConsumer<SearchBloc,SearchState>(
      listener: (context, state) {

      },
      builder:  (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.only(right: 10,left: 10,bottom: 10,top: 10),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(

                    border: OutlineInputBorder(
                    ),
                    labelText: "Search",
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    SearchBloc.get(context).add(BringImage(value));


                  },
                ),
                SizedBox(height: 10,),
                SearchBloc.get(context).searchModel?.hits?.length==null?Padding(
                  padding: const EdgeInsets.only(top:300),
                  child: Center(child: Text("Please enter an item",style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold
                  ),)),
                ): Expanded(child: ListView.separated(physics: BouncingScrollPhysics(),itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    pathImage=SearchBloc
                        .get(context)
                        .searchModel
                        ?.hits?[index].largeImageURL ??"";
                    Navigator.pushNamed(context, "/set_wallpaper_screen");
                  },
                  child: Container(
                      width: double.infinity,
                      height:200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage("${SearchBloc.get(context).searchModel?.hits?[index].largeImageURL??""}"),
                              fit: BoxFit.cover
                          )
                      )),
                ),separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount: SearchBloc.get(context).searchModel!.hits!.length))
              ],
            ),
          ),

        );

      },
    ),
);
  }
}