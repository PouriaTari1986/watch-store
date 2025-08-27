part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class LoadCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final int productId;
  const AddToCartEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class RemoveFromCartEvent extends CartEvent {
  final int productId;
  const RemoveFromCartEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class DeleteFromCartEvent extends CartEvent {
  final int productId;
  const DeleteFromCartEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}

class CartCountEvent extends CartEvent {}
