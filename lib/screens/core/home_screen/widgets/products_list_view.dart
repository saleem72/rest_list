//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../helpers/styling/styling.dart';
import '../../../auth/login_screen/models/login_response/product.dart';
import '../dashboard_bloc/dashboard_bloc.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return state.products.isNotEmpty
            ? _productsList(context, state.products)
            : _placeHolder(context);
      },
    );
  }

  Expanded _productsList(BuildContext context, List<Product> products) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.only(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: products.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _addNewDish(context);
            } else {
              return DishCard(product: products[index - 1]);
            }
          }),
    );
  }

  Expanded _placeHolder(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.only(),
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _addNewDish(context);
            } else {
              return _placeHoderItem(context);
            }
          }),
    );
  }

  Widget _addNewDish(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _addNewDishBG(),
            ),
            const SizedBox(height: 8),
            Text(
              'Add new dish',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'Fill details',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }

  Widget _addNewDishBG() {
    return Container(
      decoration: BoxDecoration(
        color: Pallet.background,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.33,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add,
                color: Pallet.background,
                size: 34,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _placeHoderItem(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _placeHolderItemBG(),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 100,
              height: 16,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Pallet.background,
                ),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 50,
              height: 16,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Pallet.background,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _placeHolderItemBG() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: BoxDecoration(
          color: Pallet.background,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.33,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Pallet.background,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DishCard extends StatelessWidget {
  const DishCard({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,##0.## SYP');
    return GestureDetector(
      onTap: () => context
          .read<DashboardBloc>()
          .add(DashboardSetActiveProduct(product: product)),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _dishBG(),
              ),
              const SizedBox(height: 8),
              Text(
                product.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                formatter.format(product.price),
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dishBG() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      // child: product.image == null ? Image.asset(Assets.dish) :
      // NetworkImage(product.image!),
      child: product.image != null
          ? Image.network(
              product.image!,
              fit: BoxFit.cover,
            )
          : product.sliderImage != null
              ? Image.network(
                  product.image!,
                  fit: BoxFit.cover,
                )
              : Image.asset(Assets.dish),
    );
  }
}
