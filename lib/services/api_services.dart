import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/castList_model.dart';
import '../models/movieList_model.dart';
import '../utils/toast_util.dart';

class NetworkHelper{
  Future<http.Response?> getRequest({
    required BuildContext context,
    required String url,
    Map<String, String>? header,
  }) async {
    http.Response? response;

    try {
      response = await http.get(Uri.parse(url), headers: header ?? {});
      debugPrint("$url---$header-->${response.body}");
    } on SocketException {


      ToastUtil.show("Please check your internet connection");
    } catch (e) {
      ToastUtil.show(e.toString());
      // rethrow;
    }
    return response;
  }




  Future<List<MovieShowListModel>?> getMovieList(
      BuildContext context,) async {
    http.Response? response;

    response = await getRequest(
        context: context,
        url:
        "https://api.tvmaze.com/shows",
        header: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response?.statusCode == 200) {
      final List<dynamic> movie = jsonDecode(response!.body);

      return movie.map((json) => MovieShowListModel.fromJson(json)).toList();

    } else {
      ToastUtil.show("Server Error Please try After sometime");
      debugPrint(response?.body);
      return null;
    }
  }


  Future<List<CastListModel>?> getCastList(
      BuildContext context,
      String id) async {
    http.Response? response;

    response = await getRequest(
        context: context,
        url:
        "https://api.tvmaze.com/shows/$id/cast",
        header: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    if (response?.statusCode == 200) {
      final List<dynamic> cast = jsonDecode(response!.body);

      return cast.map((json) => CastListModel.fromJson(json)).toList();

    } else {
      ToastUtil.show("Server Error Please try After sometime");
      debugPrint(response?.body);
      return null;
    }
  }
}