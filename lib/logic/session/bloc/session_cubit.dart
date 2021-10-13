import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/data/models/User.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(InitialSession());

  /// Takes authenticated [user]
  ///
  /// [SessionState] makes [AuthenticatedSession]
  void attemptAutoLogin(User user) => emit(AuthenticatedSession(user: user));

  /// Takes authenticated [user]
  ///
  /// [SessionState] makes [AuthenticatedSession]
  void authenticate(User user) => emit(AuthenticatedSession(user: user));

  /// [SessionState] makes [UnauthenticatedSession]
  void unauthenticate() => emit(UnauthenticatedSession());
}
