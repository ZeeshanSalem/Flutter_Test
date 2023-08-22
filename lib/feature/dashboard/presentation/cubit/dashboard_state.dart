import 'package:equatable/equatable.dart';
import 'package:test_app/core/data/response/error_response_model.dart';

enum DashboardStatus {
  initial, loading, success, failure
}


class DashboardState extends Equatable {
  final DashboardStatus status;
  final ErrorModel? message;


  const DashboardState({this.status = DashboardStatus.initial, this.message});

  DashboardState copyWith({
    DashboardStatus? status,
    ErrorModel? message,
  }) {
    return DashboardState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  factory DashboardState.fromJson(Map<String, dynamic> json) {
    return DashboardState(
      status: DashboardStatus.values[json["status"] ?? 0],
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