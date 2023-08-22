import 'package:dartz/dartz.dart';
import 'package:test_app/core/network/network_info.dart';
import 'package:test_app/feature/home/data/data_source/home_remote_data_source.dart';
import 'package:test_app/feature/home/data/model/request/movie_request_model.dart';
import 'package:test_app/feature/home/data/model/response/movie_response_model.dart';
import 'package:test_app/feature/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(
      {required this.networkInfo, required this.homeRemoteDataSource});

  @override
  Future<Either<Exception, MovieResponseModel>> getTradingMovies(
      MovieRequestModel movieRequestModel) {
    // TODO: implement getTradingMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, MovieResponseModel>> getUpcomingMovie(
      MovieRequestModel movieRequestModel) {
    // TODO: implement getUpcomingMovie
    throw UnimplementedError();
  }
}
