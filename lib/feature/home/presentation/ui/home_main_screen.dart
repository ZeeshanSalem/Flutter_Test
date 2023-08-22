import 'package:flutter/material.dart';
import 'package:test_app/core/constants/app_colors.dart';
import 'package:test_app/core/constants/typography.dart';
import 'package:test_app/feature/home/presentation/cubits/home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/home/presentation/ui/widget/categories_tile.dart';
import 'widget/widgets.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  late HomeCubit homeCubit;

  @override
  void initState() {
    homeCubit = context.read<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GreetingTile(),

        /// ==== Category Section ====
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TitleTile(
            title: 'Category',
            trailingWidget: TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'See all >',
                  style: CustomTypography.subTitleStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    color: CustomColors.secondary,
                  ),
                ),
              ),
            ),
          ),
        ),

        /// ========== Categories  =======

        SizedBox(
          height: 80,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                CategoryTile(categoryModel: homeCubit.categories[index]),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: homeCubit.categories.length,
          ),
        ),

        /// ========  Trading Movies ========
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TitleTile(
            title: 'Trading',
          ),
        ),

        /// =========== List of Trading Movie ==============

        SizedBox(
          height: 240,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                // CategoryTile(categoryModel: homeCubit.categories[index]),
            const MovieTile(),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: homeCubit.categories.length,
          ),

        ),
      ],
    );
  }
}
