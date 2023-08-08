import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:mediaplex/data/movies/movies.dart';
import 'package:mediaplex/data/series/series.dart';
import 'package:mediaplex/data/channels/channel.dart';
import 'package:mediaplex/utils/network_constants.dart';
import 'package:mediaplex/data/coming_soon/coming_soon.dart';

class NetworkRepo {
  static final client = http.Client();
  static const Map<String, String> tokenData = {
    'Content-type': 'application/x-www-form-urlencoded',
    'Authorization': NetworkConstants.token
  };

  //* Channel section

  // Get indian channel list
  Future<List<Channel>> indianChannelList() async {
    List<Channel> channelList = [];
    try {
      final response = await client.get(Uri.parse('${NetworkConstants.baseUrl}indianChannelList'), headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      for (var mapElement in parsed) {
        channelList.add(Channel.fromMap(mapElement));
      }

      return channelList;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  //* Home page section

  // Get featured banner
  Future<Movie> getFeaturedBanner() async {
    try {
      final response = await client.get(Uri.parse('${NetworkConstants.baseUrl}featuredBanner'), headers: tokenData);
      final movie = Movie.fromJson(response.body);

      return movie;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  // Get trending list
  Future<List<Movie>> trendingList() async {
    List<Movie> trendingList = [];
    try {
      final response = await client.get(Uri.parse('${NetworkConstants.baseUrl}trendingList'), headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      for (var mapElement in parsed) {
        trendingList.add(Movie.fromMap(mapElement));
      }

      return trendingList;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  // New arrivals list
  Future<List<Movie>> newArrivalList() async {
    List<Movie> newArrivals = [];
    try {
      final response = await client.get(Uri.parse('${NetworkConstants.baseUrl}newarrivals'), headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      for (var mapElement in parsed) {
        newArrivals.add(Movie.fromMap(mapElement));
      }

      return newArrivals;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  // Coming soon
  Future<List<ComingSoon>> getComingSoonList() async {
    List<ComingSoon> comingsoonList = [];

    try {
      final response = await client.get(Uri.parse('${NetworkConstants.baseUrl}commingsoon'), headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      for (var comingsoonElement in parsed) {
        comingsoonList.add(ComingSoon.fromMap(comingsoonElement));
      }

      return comingsoonList;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  //* Movie page

  // Get movie list according to category
  Future<List<Movie>> getMovieCategoryList(String categoryUrl) async {
    List<Movie> movieList = [];
    try {
      final response = await client.get(Uri.parse('${NetworkConstants.baseUrl}$categoryUrl'), headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      for (var mapElement in parsed) {
        movieList.add(Movie.fromMap(mapElement));
      }

      return movieList;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }

  //* Series page

  // Get series list according to category
  Future<List<Series>> getSeriesCategoryList(String categoryUrl) async {
    List<Series> seriesList = [];
    try {
      final response = await client.get(Uri.parse('${NetworkConstants.baseUrl}$categoryUrl'), headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      for (var mapElement in parsed) {
        seriesList.add(Series.fromMap(mapElement));
      }

      return seriesList;
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }
}