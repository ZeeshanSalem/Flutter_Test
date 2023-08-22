import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

class Utils extends Equatable {
  static String get currentDateTime => DateTime.now().toString();

  static onFocusChange() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []); // hide status + action buttons
  }

  @override
  List<Object?> get props => [];



}