//

import 'package:flutter/material.dart';
import 'package:rest_list/helpers/styling/assets.dart';
import 'package:rest_list/helpers/styling/pallet.dart';
import 'package:rest_list/screens/home_screen/pages/home_settings_page.dart';

import 'pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: Column(
        children: [
          _header(context),
          if (_selectedPage == 0) const Expanded(child: HomeMenuPage()),
          if (_selectedPage == 1) const Expanded(child: HomeSettingsPage()),
        ],
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
