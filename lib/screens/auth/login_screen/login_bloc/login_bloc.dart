//

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../helpers/auth_manager/auth_cubit/auth_cubit.dart';
import '../../../../helpers/dashboard_bloc/dashboard_bloc.dart';
import '../../../../models/failure.dart';
import '../../../../models/models.dart';
import '../service/login_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthCubit _authCubit;
  final LoginService _service;
  final DashboardBloc _dashboardBloc;
  LoginBloc({
    required AuthCubit authCubit,
    required LoginService service,
    required DashboardBloc dashboardBloc,
  })  : _authCubit = authCubit,
        _service = service,
        _dashboardBloc = dashboardBloc,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginEmailUnfocused>(_onEmailUnfocused);
    on<LoginPasswordUnfocused>(_onPasswordUnfocused);
    on<LoginFormSubmitted>(_onFormSubmitted);
    on<LoginVisitorSubmitted>(_onVisitorSubmitted);
  }

  @override
  void onTransition(Transition<LoginEvent, LoginState> transition) {
    // print(transition);
    super.onTransition(transition);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email.valid ? email : Email.pure(event.email),
      status: Formz.validate([email, state.password]),
    ));
  }

  void _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password.valid ? password : Password.pure(event.password),
      status: Formz.validate([state.email, password]),
    ));
  }

  void _onEmailUnfocused(LoginEmailUnfocused event, Emitter<LoginState> emit) {
    final email = Email.dirty(state.email.value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void _onPasswordUnfocused(
      LoginPasswordUnfocused event, Emitter<LoginState> emit) {
    final password = Password.dirty(state.password.value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    ));
  }

  void _onFormSubmitted(
      LoginFormSubmitted event, Emitter<LoginState> emit) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    emit(state.copyWith(
      email: email,
      password: password,
      status: Formz.validate([email, password]),
    ));
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        final result = await _service.login(
          email: email.value,
          password: password.value,
        );
        result.fold(
          (failure) {
            emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              failure: failure,
            ));
          },
          (loginResponse) {
            _dashboardBloc.add(DashboardUserLoggedIn(user: loginResponse.user));
            _authCubit.userLogedIn(loginResponse);
            emit(state.copyWith(status: FormzStatus.submissionSuccess));
          },
        );
      } catch (ex) {
        if (ex is Failure) {
          emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            failure: ex,
          ));
        } else {
          emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            failure: const Failure(message: 'unKnown error'),
          ));
        }
      }
    }
  }

  void _onVisitorSubmitted(
      LoginVisitorSubmitted event, Emitter<LoginState> emit) async {}
}
