//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/network_manager/network_manager_cubit.dart';

class ConnectionIcon extends StatelessWidget {
  const ConnectionIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkManagerCubit, NetworkManagerState>(
      builder: (context, state) {
        if (state.type == ConnectionType.wifi) {
          return const Icon(Icons.signal_wifi_4_bar);
        } else if (state.type == ConnectionType.mobile) {
          return const Icon(Icons.mobile_friendly);
        } else {
          return const Icon(Icons.no_cell);
        }
      },
    );
  }
}
