import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/authentification/signin.dart';
import 'package:project1/authentification/signup.dart';
import 'package:project1/cubit/Cubits.dart';
import 'package:project1/cubit/States.dart';
import 'package:project1/pages/detailpage_bouquet.dart';
import 'package:project1/pages/Details.dart';
import 'package:project1/pages/Home_page.dart';
import 'package:project1/pages/Welcome.dart';
import 'package:project1/menu.dart';
import 'package:project1/pages/order.dart';

class Logics extends StatefulWidget {
  const Logics({Key? key}) : super(key: key);

  @override
  State<Logics> createState() => _LogicsState();
}

class _LogicsState extends State<Logics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Cubits, States>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return Welcome();
          }
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return menu();
          }
          if (state is Detail_bouquetState) {
            return Details_bouquet();
          }
          if (state is OrderState) {
            return order();
          }
          if (state is Signup) {
            return RegistrationScreen();
          }
          if (state is Signin) {
            return LoginScreen();
          }
          if (state is DetailState) {
            return Details();
          } else {
            return Container();
          }
        },
      ),
    );
    throw UnimplementedError();
  }
}
