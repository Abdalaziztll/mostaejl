import 'package:bloc/bloc.dart';

import 'package:herry_up/trask7/view/model/order_list.dart';
import 'package:herry_up/trask7/view/service/creatOrders_service.dart';

import 'package:meta/meta.dart';



part 'submit_order_event.dart';
part 'submit_order_state.dart';

class SubmitOrderBloc extends Bloc<SubmitOrderEvent, SubmitOrderState> {
  SubmitOrderBloc() : super(SubmitOrderInitial()) {
    on<sendInfo>((event, emit)async {
      emit(loading());
      var response = await auth().orders(event.body);
      if (response){
        emit (succes(token: 'token'));
      }else{
        emit(error());
      }

      
    });
  }
}
