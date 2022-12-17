//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/settings_cubit/settings_cubit.dart';
import '../../../../helpers/styling/styling.dart';
import '../../../../models/settings_item.dart';

class HomeSettingsPage extends StatelessWidget {
  const HomeSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Drawer(
          width: 220,
          backgroundColor: Pallet.background,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SettingsItemsList(),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              color: Colors.white,
              child: Container(),
            ),
          ),
        ),
      ],
    );
  }
}

class SettingsItemsList extends StatelessWidget {
  const SettingsItemsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsItem>(
      builder: (context, state) => Column(
        children: SettingsItem.values
            .map((item) => SettingsItemTile(
                  item: item,
                  isActive: item == state,
                ))
            .toList(),
      ),
    );
  }
}

class SettingsItemTile extends StatelessWidget {
  const SettingsItemTile({
    super.key,
    required this.item,
    required this.isActive,
  });
  final SettingsItem item;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<SettingsCubit>().setActiveItem(item),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        width: double.infinity,
        height: 34,
        child: Stack(
          children: [
            isActive
                ? Hero(
                    tag: 'SETTINGS_ITEM',
                    createRectTween: (begin, end) {
                      return MaterialRectCenterArcTween(begin: begin, end: end);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 34,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Pallet.darkAppBar,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isActive ? Colors.white : Colors.black),
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    size: 16,
                    color: isActive ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
