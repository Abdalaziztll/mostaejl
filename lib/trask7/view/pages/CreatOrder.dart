import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herry_up/trask7/view/config/bloc/bloc/bloc/submit_order_bloc.dart';
import 'package:herry_up/trask7/view/model/order_list.dart';


class CreatOrder extends StatefulWidget {
  const CreatOrder({super.key});

  @override
  State<CreatOrder> createState() => _CreatOrderState();
}

class _CreatOrderState extends State<CreatOrder> {
  // ignore: non_constant_identifier_names
  TextEditingController NUM_OF_PASS=TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController current_pass_num=TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController dis_id=TextEditingController();
  TextEditingController gen=TextEditingController();
  bool hurryy=false;
  
  @override
  Widget build(BuildContext context) {
    return 
      BlocProvider(
        create: (context) => SubmitOrderBloc(),
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10,10,10,0),
              child: TextFormField(
                controller:NUM_OF_PASS ,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                  hintText: "number of passengers"
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),child: 
            TextFormField(
              controller:  current_pass_num,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                hintText: "current passenger number"
              ),

            ),),
               Padding(padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),child: 
            TextFormField(
              controller: dis_id,
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                hintText: "dis id"
              ),


            ),),
            Padding(padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),
            child: InkWell(child: const Text("hurry?press me"),
            onTap: () {hurryy=true;
              
            },

            )
              
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,30,0,10),
              child: TextFormField(
                controller:gen ,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                  hintText: "your gender"
                ),
                
              ),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),
            child: ElevatedButton(onPressed:(){
              context.read<SubmitOrderBloc>().add(sendInfo(body: OrderShow(
                top_passenger_count: int.parse(NUM_OF_PASS.text),
               current_passenger_count: int.parse(current_pass_num.text),
               destination_vertices_id: int.parse(dis_id.text),
                is_hurry: hurryy, genders: gen.text
                )
                 )
                  );
             }, 
            child: const Text("Create Order")),)
                ]
               )
              )
            );
          },
        ),
      );
    
  }
}