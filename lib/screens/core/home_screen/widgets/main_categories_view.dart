//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../helpers/styling/styling.dart';
import '../../../../models/product_category.dart';
import '../../../../helpers/dashboard_bloc/dashboard_bloc.dart';
import 'categories_add_button.dart';

class MainCategoriesView extends StatelessWidget {
  const MainCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 44,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Row(
                  children: [
                    CategoriesAddButton(onTap: () {}),
                    const SizedBox(width: 8),
                    Expanded(
                      child: state.categories.isNotEmpty
                          ? _categoriesList(
                              state.categories, state.activeCatgory)
                          : _categoriesPlaceHolder(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(Assets.arrowLeft),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(Assets.arrowRight),
                    ),
                    _sreachTextField(context)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _categoriesList(
      List<ProductCategory> categories, ProductCategory? activeCategory) {
    return ListView.builder(
        padding: const EdgeInsets.only(),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextButton(
              onPressed: () => context
                  .read<DashboardBloc>()
                  .add(DashBoardSetActiveCategory(category: category)),
              child: Text(
                category.name,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: activeCategory?.id == category.id
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
              ),
            ),
          ));
        });
  }

  Widget _categoriesPlaceHolder() {
    return ListView.builder(
        padding: const EdgeInsets.only(),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 60,
                height: 16,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          );
        });
  }

  Container _sreachTextField(BuildContext context) {
    return Container(
      width: 210,
      height: 32,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(9)),
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(Assets.search),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: TextField(
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(),
                hintText: 'Search',
                // filled: true,
                // fillColor: Colors.pink,
                isCollapsed: true,
                hintStyle: Theme.of(context).textTheme.bodySmall,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
