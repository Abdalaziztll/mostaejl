
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herry_up/trask7/view/config/bloc/bloc/order_create_bloc.dart';


class PindingOrders extends StatelessWidget {
  const PindingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrderCreateBloc>().add(submitedOrder());
    return Scaffold(
      body: BlocConsumer<OrderCreateBloc, OrderCreateState>(
        listener: (context, state) {
          if(state is offline){
            ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: Text("you'r offline")));
          }
        },
        builder: (context, state) {
          if (state is error){
            return const Center(
              child: Text("there is an error"),
            );
          }else if(state is succes){
            return ListView.builder(itemCount: state.ordersList.length,itemBuilder: (context, index) =>ListTile(
            leading:Text(state.ordersList[index].top_passenger_count.toString()) ,
            title: Text(state.ordersList[index].current_passenger_count.toString()),
            subtitle: Text(state.ordersList[index].destination_vertices_id.toString()),

          ) );
          }else{
            return const Center(
              child: Text("thereis an error"),
            );
          }
        },
      ),
 
    );
  }
}
