import 'package:bloc/bloc.dart';
import 'package:di_state_managment/data/models/cart_model.dart';
import 'package:di_state_managment/data/repo/cart_repo.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository _cartRepository;

  CartBloc(this._cartRepository) : super(CartInitial()) {
    on<LoadCartEvent>((event, emit) async {
      emit(CartLoading());
      try {
        final cart = await _cartRepository.getUserCart();
        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartError('خطا در دریافت سبد خرید'));
      }
    });

    on<AddToCartEvent>((event, emit) async {
      emit(CartLoading());
      try {
        final cart = await _cartRepository.addToCart(productId: event.productId);
        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartError('خطا در افزودن محصول به سبد خرید'));
      }
    });

    on<RemoveFromCartEvent>((event, emit) async {
      emit(CartLoading());
      try {
        final cart = await _cartRepository.removeFromCart(productId: event.productId);
        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartError('خطا در کم کردن محصول از سبد خرید'));
      }
    });

    on<DeleteFromCartEvent>((event, emit) async {
      emit(CartLoading());
      try {
        final cart = await _cartRepository.deleteFromCart(productId: event.productId);
        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartError('خطا در حذف محصول از سبد خرید'));
      }
    });

    on<CartCountEvent>((event, emit) async {
      try {
        await _cartRepository.cartCountItems();
        // فقط ValueNotifier به روز می‌شود، نیازی به emit نیست
      } catch (e) {
        // خطا در شمارش آیتم‌ها
      }
    });
  }
}
