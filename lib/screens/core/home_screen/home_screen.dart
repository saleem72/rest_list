//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rest_list/models/settings_item.dart';

import '../../../helpers/auth_manager/auth_cubit/auth_cubit.dart';
import '../../../helpers/dashboard_bloc/dashboard_bloc.dart';
import '../../../helpers/settings_cubit/settings_cubit.dart';
import '../../../helpers/styling/styling.dart';
import '../../../widgets/main_widgets.dart';
import '../../../models/restaurant/restaurant.dart';
import 'home_widgets.dart';
import 'pages.dart';
import 'pages/home_settings_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: const HomeScreenContent(),
    );

    //  child: const HomeScreenContent(),
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  int _selectedPage = 0;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
    context.read<DashboardBloc>().add(DashboardGetData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) => Scaffold(
        backgroundColor: Pallet.background,
        body: Stack(
          children: [
            Column(
              children: [
                _header(context),
                if (_selectedPage == 0) const Expanded(child: HomeMenuPage()),
                if (_selectedPage == 1)
                  const Expanded(child: HomeSettingsPage()),
              ],
            ),
            LoadingView(isVisible: state.isLoading),
            const HomeFailureView(),
          ],
        ),
      ),
    );
  }

  Container _header(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Pallet.darkAppBar,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Image.asset(
              Assets.logo,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 60),
          Row(
            children: [
              IconButton(
                onPressed: () => setState(() {
                  _selectedPage = 0;
                }),
                icon: Image.asset(Assets.branchs),
              ),
              IconButton(
                  onPressed: () => setState(() {
                        context
                            .read<SettingsCubit>()
                            .setActiveItem(SettingsItem.offers);
                        _selectedPage = 1;
                      }),
                  icon: Image.asset(Assets.offers)),
              IconButton(
                  onPressed: () => setState(() {
                        context
                            .read<SettingsCubit>()
                            .setActiveItem(SettingsItem.account);
                        _selectedPage = 1;
                      }),
                  icon: Image.asset(Assets.settings)),
              IconButton(
                onPressed: () => _showQR(context),
                icon: Image.asset(Assets.qr),
              ),
              const HomeContextMenu(),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                final authCubit = context.read<AuthCubit>();
                authCubit.logout();
              },
              icon: Image.asset(Assets.notifications)),
          const SizedBox(width: 16),
          const ActiveRestaurantHeader(),
        ],
      ),
    );
  }

  _showQR(BuildContext context) {
    final restaurant = context.read<DashboardBloc>().state.activeRestaurant;
    if (restaurant != null && restaurant.qrUrl.isNotEmpty) {
      // print(restaurant.qrUrl);
      // print(restaurant.qr);
      // print(restaurant.qrCode);

      final alert = AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: SvgPicture.network(
                restaurant.qr,
                placeholderBuilder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('ok'),
          ),
        ],
      );
      showDialog(
        context: context,
        builder: (context) {
          return alert;
        },
      );
    }
  }
}

class HomeContextMenu extends StatelessWidget {
  const HomeContextMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        if (state.user != null && state.user!.restaurants.isNotEmpty) {
          return _moreMenu(context, state.user!.restaurants);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  PopupMenuButton<Restaurant> _moreMenu(
      BuildContext context, List<Restaurant> restaurants) {
    return PopupMenuButton(
      icon: Icon(
        Icons.search,
        color: Theme.of(context).primaryColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      offset: const Offset(0, kToolbarHeight),
      onSelected: (item) {
        context
            .read<DashboardBloc>()
            .add(DashboardSetActiveRestaurant(restaurant: item));
      },
      itemBuilder: (context) => restaurants
          .map((e) => PopupMenuItem(
              value: e,
              child: PopupMenuItemCard(
                restaurant: e,
              )))
          .toList(),
    );
  }
}

class PopupMenuItemCard extends StatelessWidget {
  const PopupMenuItemCard({
    super.key,
    required this.restaurant,
  });
  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: restaurant.image.isNotEmpty
              ? CircleAvatar(
                  backgroundImage: NetworkImage(restaurant.image),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle),
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(Assets.generalLogo),
                ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            ),
            Text(
              restaurant.address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey.shade400),
            ),
          ],
        ),
      ],
    );
  }
}
