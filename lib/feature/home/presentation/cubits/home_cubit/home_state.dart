import 'package:equatable/equatable.dart';
import 'package:test_app/core/data/response/error_response_model.dart';

enum HomeStatus {
  initial, loading, success, failure
}


class HomeState extends Equatable {
  final HomeStatus status;
  final ErrorModel? message;


  const HomeState({this.status = HomeStatus.initial, this.message});

  HomeState copyWith({
    HomeStatus? status,
    ErrorModel? message,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  factory HomeState.fromJson(Map<String, dynamic> json) {
    return HomeState(
      status: HomeStatus.values[json["status"] ?? 0],
      message:
      json["message"] != null ? ErrorModel.fromJson(json["message"]) : null,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    "status": status.index,
    "message": message != null ? message!.toJson() : null,
  };

  @override
  List<Object?> get props => [
    status,
    message,
  ];


}