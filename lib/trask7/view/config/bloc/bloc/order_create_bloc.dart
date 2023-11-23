import 'package:bloc/bloc.dart';
import 'package:herry_up/trask7/view/model/order_list.dart';
import 'package:herry_up/trask7/view/service/ordersList_service.dart';
import 'package:meta/meta.dart';

part 'order_create_event.dart';
part 'order_create_state.dart';

class OrderCreateBloc extends Bloc<OrderCreateEvent, OrderCreateState> {
  OrderCreateBloc() : super(OrderCreateInitial()) {
    on<submitedOrder>((event, emit)async {try {
      emit(loading());
      dynamic temp= await orderBringer().getOrder();
      List<OrderShow> ordersList =List.generate(temp.length, (index) => OrderShow.fromMap(temp[index]));
      emit(succes(ordersList: ordersList));

      
    } catch (e) {
      emit(offline());
      
    }
      


      
    });
    
  }
  
}
