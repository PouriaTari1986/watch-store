part of 'authentication_cubit.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class LoadingState extends AuthenticationState {}

final class ErrorState extends AuthenticationState {}

final class LoadedState extends AuthenticationState {
  final String mobile;
  const LoadedState({required this.mobile});

  @override
  List<Object> get props => [mobile];
}

final class VerifiedState extends AuthenticationState {}

final class VerifiedIsRegisterdeState extends AuthenticationState {}

final class VerifiedIsNotRegisterdeState extends AuthenticationState {}

final class LoggedInState extends AuthenticationState {}

final class LoggeOutState extends AuthenticationState {}
