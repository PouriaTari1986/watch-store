import 'package:bloc/bloc.dart';
import 'package:di_state_managment/data/models/home.dart';
import 'package:di_state_managment/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';



class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final IHomeRepo homeRepo;
  HomeBloc(this.homeRepo) : super(HomeLoading()) {
    on<HomeEvent>((event, emit) async {


      if (event is HomeInIt) {
        try {
          emit(HomeLoading());
          final home = await homeRepo.getHome();
          emit(HomeLoaded(home));
        } catch (e) {
          emit(HomeError());
        }
      } else {
        
      }
    });
  }
}
