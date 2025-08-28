part of 'product_single_bloc.dart';

sealed class ProductSingleEvent extends Equatable {
  const ProductSingleEvent();

  @override
  List<Object> get props => [];
}

class ProductSingleInIt extends ProductSingleEvent{
  final int id;
  const ProductSingleInIt({required this.id});
   @override
  List<Object> get props => [id];
}
