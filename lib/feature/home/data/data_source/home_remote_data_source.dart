import 'package:test_app/core/error/exception.dart';
import 'package:test_app/core/network/network_client.dart';
import 'package:test_app/core/network/network_constants.dart';
import 'package:test_app/feature/home/data/model/request/movie_request_model.dart';
import 'package:dio/dio.dart';

class HomeRemoteDataSource {
  final NetworkClient networkClient;

  HomeRemoteDataSource({required this.networkClient});

  Future<dynamic> getTradingMovies(MovieRequestModel movieRequestModel) async {
    var response = await networkClient.invoke(
        kTradingMovieApi, RequestType.get,
        queryParameters: movieRequestModel.toJson());

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException(
          dioError: DioException(
              error: response,
              type: DioExceptionType.badResponse,
              requestOptions: response.requestOptions));
    }
  }

  Future<dynamic> getUpcomingMovie(MovieRequestModel movieRequestModel) async {
    var response = await networkClient.invoke(
        kUpcomingMovieApi, RequestType.get,
        queryParameters: movieRequestModel.toJson());

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return ServerException(
          dioError: DioException(
              error: response,
              type: DioExceptionType.badResponse,
              requestOptions: response.requestOptions));
    }
  }
}
