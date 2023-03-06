import 'package:bloc/bloc.dart';
import 'package:project1/cubit/States.dart';
import 'package:project1/models/datamodel.dart';
import 'package:project1/pages/Welcome.dart';
import 'package:project1/services/dataservices.dart';

class Cubits extends Cubit<States> {
  Cubits() : super(InitialState()) {
    emit(Signin());
  }

  //late final flowers;
  //late final bouquets;
  void getData() async {
    try {
      emit(LoadingState());
      // flowers = await data.getInfo();
      // bouquets = await data.getInfo();
      emit(LoadedState());
    } catch (e) {
      print(e);
    }
  }

  void nextPage() {
    try {
      emit(LoadedState());
    } catch (e) {
      print(e);
    }
  }

  detailsPage() {
    try {
      emit(DetailState());
    } catch (e) {
      print(e);
    }
  }

  detail_bouquet() {
    try {
      emit(Detail_bouquetState());
    } catch (e) {
      print(e);
    }
  }

  void orderState() {
    try {
      emit(OrderState());
    } catch (e) {
      print(e);
    }
  }

  void signinState() {
    try {
      emit(Signin());
    } catch (e) {
      print(e);
    }
  }

  void signupState() {
    try {
      emit(Signup());
    } catch (e) {
      print(e);
    }
  }

  welcome() {
    emit(WelcomeState());
  }

  gohome() {
    emit(LoadedState());
  }
}
