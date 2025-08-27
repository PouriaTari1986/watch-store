part of 'cart_bloc.dart';

enum CartAction { add, remove, delete, none }

abstract class CartState extends Equatable {
  final CartAction lastAction;
  const CartState({this.lastAction = CartAction.none});

  @override
  List<Object?> get props => [lastAction];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartModel cart;

const CartLoaded(this.cart,{super.lastAction});
  


  @override
  List<Object?> get props => [cart, lastAction];
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);

  @override
  List<Object?> get props => [message];
}
