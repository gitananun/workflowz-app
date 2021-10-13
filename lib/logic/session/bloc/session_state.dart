part of 'session_cubit.dart';

abstract class SessionState {}

class InitialSession extends SessionState {}

class AuthenticatedSession extends Equatable implements SessionState {
  final User user;
  const AuthenticatedSession({required this.user});

  @override
  List<Object?> get props => [user];
}

class UnauthenticatedSession extends SessionState {}
