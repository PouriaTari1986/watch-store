part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class LoadingState extends RegisterState {}

final class ErrorState extends RegisterState {}

final class OkResponseState extends RegisterState {}

final class LocationPickedState extends RegisterState {
  final GeoPoint? location;
  final String? address;
  const LocationPickedState({required this.location, required this.address});
  @override
  List<Object> get props => [Location, address??""];
}
