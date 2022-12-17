//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../helpers/styling/styling.dart';
import '../../../../models/product_category.dart';
import '../../../../helpers/dashboard_bloc/dashboard_bloc.dart';
import 'categories_add_button.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.activeCatgory?.name ?? '',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 44,
              child: Row(
                children: [
                  CategoriesAddButton(
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: (state.activeCatgory != null) &&
                            (state.activeCatgory!.subcategories.isNotEmpty)
                        ? _subCategoriesList(state.activeCatgory!.subcategories,
                            state.activeSubCatgory)
                        : _subCategoriesPlaceholder(),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(Assets.coloredLeftArrow),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(Assets.coloredRightArrow),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _subCategoriesList(
      List<ProductCategory> subCategories, ProductCategory? activeSubCategory) {
    return ListView.builder(
      padding: const EdgeInsets.only(),
      itemCount: subCategories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final subCategory = subCategories[index];
        return Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextButton(
            onPressed: () => context
                .read<DashboardBloc>()
                .add(DashBoardSetActiveSubCategory(category: subCategory)),
            child: Text(
              subCategory.name,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: activeSubCategory?.id == subCategory.id
                        ? Theme.of(context).primaryColor
                        : Colors.black,
                  ),
            ),
          ),
        ));
      },
    );
  }

  Widget _subCategoriesPlaceholder() {
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
      },
    );
  }
}
