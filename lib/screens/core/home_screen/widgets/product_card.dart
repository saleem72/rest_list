//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../helpers/styling/styling.dart';
import '../../../../models/product.dart';
import '../../../../helpers/dashboard_bloc/dashboard_bloc.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.isActive});
  final Product product;
  final bool isActive;
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
          decoration: BoxDecoration(
            color:
                isActive ? Theme.of(context).primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _dishBG(),
              ),
              const SizedBox(height: 8),
              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                formatter.format(product.price),
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: isActive
                          ? Colors.white
                          : Theme.of(context).primaryColor,
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
              fit: BoxFit.fill,
            )
          : product.sliderImage != null
              ? Image.network(
                  product.image!,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  Assets.dish,
                  fit: BoxFit.fill,
                ),
    );
  }
}
