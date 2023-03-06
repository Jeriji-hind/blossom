import 'package:equatable/equatable.dart';
import 'package:project1/models/datamodel.dart';
import 'package:project1/services/dataservices.dart';

abstract class States extends Equatable {}

class InitialState extends States {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends States {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class menuState extends States {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

//this.flowers, this.bouquets
class LoadedState extends States {
  LoadedState();
  // final List<Datamodel> flowers;
  //final List<Datamodel> bouquets;
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends States {
  LoadingState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class DetailState extends States {
  DetailState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Detail_bouquetState extends States {
  Detail_bouquetState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class OrderState extends States {
  OrderState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Signin extends States {
  Signin();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Signup extends States {
  Signup();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
