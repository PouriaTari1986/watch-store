import 'package:bloc/bloc.dart';
import 'package:di_state_managment/data/models/product_details.dart';
import 'package:di_state_managment/data/repo/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'product_single_event.dart';
part 'product_single_state.dart';

class ProductSingleBloc extends Bloc<ProductSingleEvent, ProductSingleState> {

  final IProductRepo _iProductDataSource;
  ProductSingleBloc(this._iProductDataSource, ) : super(ProductSingleLoading()) {
    on<ProductSingleEvent>((event, emit) async {

      if (event is ProductSingleInIt) {
        try {
          emit(ProductSingleLoading());
          final productDetails = await _iProductDataSource.productDetails(event.id);
          emit(ProductSingleLoaded(productDetails));
        } catch (e) {
          emit(ProductSingleError());
        }
      } 

    });
  }
}
