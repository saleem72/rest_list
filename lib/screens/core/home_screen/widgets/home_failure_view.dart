//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_list/models/failure.dart';

import '../dashboard_bloc/dashboard_bloc.dart';

class HomeFailureView extends StatelessWidget {
  const HomeFailureView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return state.failure == null
            ? const SizedBox.shrink()
            : _error(context, state.failure!);
      },
    );
  }

  Container _error(BuildContext context, Failure failure) {
    return Container(
      color: Colors.black.withOpacity(0.2),
      child: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Error',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  failure.message,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),
                TextButton(
                  onPressed: () =>
                      context.read<DashboardBloc>().add(DashboardClearError()),
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white),
                  child: const Text('Ok'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
