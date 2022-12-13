import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rest_list/screens/core/home_screen/repository/dashboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({required this.repository}) : super(DashboardInitial()) {
    on<DashboardGetData>(_onGetData);
  }

  final DashboardRepository repository;
  _onGetData(DashboardGetData event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    await repository.getData();
    emit(DashboardInitial());
  }
}
