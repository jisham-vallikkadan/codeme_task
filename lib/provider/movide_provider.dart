
import 'package:flutter/material.dart';

import '../models/castList_model.dart';
import '../models/movieList_model.dart';
import '../services/api_services.dart';

class MovieProvider with ChangeNotifier{
 bool isLoading=false;

 List<MovieShowListModel> tvShows = [];
 List<CastListModel> cast = [];
  fetchMovieList(BuildContext context) async {
    isLoading = true;
    tvShows =
    (await NetworkHelper().getMovieList(context))!;
    isLoading = false;
    notifyListeners();
  }

 fetchcastList(BuildContext context,String? id) async {
   isLoading = true;
   cast =
   (await NetworkHelper().getCastList(context,id!))!;
   isLoading = false;
   notifyListeners();
 }

}