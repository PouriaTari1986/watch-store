import 'package:bloc/bloc.dart';
import 'package:di_state_managment/data/models/product.dart';
import 'package:di_state_managment/data/repo/product_repo.dart';
import 'package:equatable/equatable.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductRepo _iProductRepo;

  ProductListBloc(this._iProductRepo) : super(ProductListLoading()) {
    on<ProductListEvent>((event, emit) async {
      if (event is ProductListInIt) {
        try {
          emit(ProductListLoading());
          final productList = await _iProductRepo.getAllByCategory(event.param);
          emit(ProductListLoaded(productList));
        } catch (e) {
          emit(ProductListError());
        }
      }
    });
  }
}
