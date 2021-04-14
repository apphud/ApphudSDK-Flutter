import 'package:apphud/models/sk_product/sk_product_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDelegateCubit extends Cubit<AppState> {

  AppDelegateCubit({required AppState state}) : super(AppState.initialState());

  void dispose() {}
}

class AppState {

 List<SKProductWrapper> products;


  AppState({
    required this.products,
  });

  AppState copyWith({
    List<SKProductWrapper>? products
  }) {
    return AppState(
     products: products ?? this.products
    );
  }

  factory AppState.initialState() {
    return AppState(
      products:  List<SKProductWrapper>()
    );
  }
}