//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/dashboard_bloc/dashboard_bloc.dart';
import '../../../../helpers/styling/styling.dart';

class ActiveRestaurantHeader extends StatelessWidget {
  const ActiveRestaurantHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: (state.activeRestaurant != null)
                  ? CircleAvatar(
                      backgroundImage:
                          NetworkImage(state.activeRestaurant!.image),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(width: 16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Hello, ',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Pallet.meduimDarkText,
                        ),
                  ),
                  TextSpan(
                    text: (state.activeRestaurant != null)
                        ? state.activeRestaurant!.name
                        : 'Imad Farra',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
