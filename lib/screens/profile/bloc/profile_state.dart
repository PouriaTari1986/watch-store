part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileError extends ProfileState {}

final class ProfileLoaded extends ProfileState {}

final class ProfileOrder extends ProfileState {}

final class ProfileCancel extends ProfileState {}

final class ProfileProsses extends ProfileState {}
