//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_list/helpers/styling/assets.dart';
import 'package:rest_list/helpers/styling/pallet.dart';
import 'package:rest_list/screens/core/home_screen/pages/home_settings_page.dart';
import 'package:rest_list/screens/core/home_screen/repository/dashboard_repository.dart';
import 'package:rest_list/screens/core/home_screen/service/dashboard_service.dart';
import 'package:rest_list/widgets/loading_view.dart';

import '../../../dependancy_injection.dart' as di;
import 'dashboard_bloc/dashboard_bloc.dart';
import 'pages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(
        repository: DashboardRepositoryMock(
          service: DashboardServiceMock(safe: di.locator()),
        ),
      )..add(DashboardGetData()),
      child: const HomeScreenContent(),
    );
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
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) => Scaffold(
        backgroundColor: const Color(0xFFEFEFEF),
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
            LoadingView(isVisible: (state is DashboardLoading) ? true : false)
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
              IconButton(onPressed: () {}, icon: Image.asset(Assets.branchs)),
              IconButton(onPressed: () {}, icon: Image.asset(Assets.offers)),
              IconButton(onPressed: () {}, icon: Image.asset(Assets.settings)),
              IconButton(onPressed: () {}, icon: Image.asset(Assets.qr)),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Image.asset(Assets.notifications)),
          const SizedBox(width: 16),
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
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
                  text: 'Imad Farra',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
