part of 'product_list_bloc.dart';

sealed class ProductListEvent extends Equatable {
  const ProductListEvent();

  @override
  List<Object> get props => [];
}

class ProductListInIt extends ProductListEvent {
  // ignore: strict_top_level_inference, prefer_typing_uninitialized_variables
  final param;
  const ProductListInIt({required this.param});

  @override
  List<Object> get props => [param];
}
