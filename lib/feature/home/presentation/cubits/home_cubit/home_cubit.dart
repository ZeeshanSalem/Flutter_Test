import 'package:flutter/material.dart';
import 'package:test_app/core/cubit/base_cubit.dart';
import 'package:test_app/feature/home/data/model/category_model.dart';
import 'package:test_app/feature/home/presentation/cubits/home_cubit/home_state.dart';

class HomeCubit extends BaseCubit<HomeState>  {
  HomeCubit()
      : super(const HomeState(status: HomeStatus.initial));

  List<CategoryModel> categories = [
    CategoryModel(iconData: Icons.call_to_action_outlined, name: 'Action'),
    CategoryModel(iconData: Icons.add_a_photo_outlined, name: 'Adventure'),
    CategoryModel(iconData: Icons.add_a_photo_outlined, name: 'Animation'),
    CategoryModel(iconData: Icons.add_a_photo_outlined, name: 'Comedy'),
    CategoryModel(iconData: Icons.add_a_photo_outlined, name: 'Crime'),
    CategoryModel(iconData: Icons.add_a_photo_outlined, name: 'horror'),
    CategoryModel(iconData: Icons.add_a_photo_outlined, name: 'Cartoon'),
  ];
}
