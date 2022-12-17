//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/dashboard_bloc/dashboard_bloc.dart';
import 'add_new_product_view.dart';
import 'product_details.dart';

class MenuDetailsSectionView extends StatelessWidget {
  const MenuDetailsSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return state.activeProduct == null
            ? const AddNewProductView()
            : ProductDetails(product: state.activeProduct!);
      },
    );
  }
}
