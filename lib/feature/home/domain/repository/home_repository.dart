import 'package:dartz/dartz.dart';
import 'package:test_app/feature/home/data/model/request/movie_request_model.dart';
import 'package:test_app/feature/home/data/model/response/movie_response_model.dart';

abstract class HomeRepository {

  Future<Either<Exception, MovieResponseModel>> getTradingMovies(
      MovieRequestModel movieRequestModel);

  Future<Either<Exception, MovieResponseModel>> getUpcomingMovie(
      MovieRequestModel movieRequestModel);

}