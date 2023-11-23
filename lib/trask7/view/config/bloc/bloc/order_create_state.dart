// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_create_bloc.dart';

@immutable
sealed class OrderCreateState {}

final class OrderCreateInitial extends OrderCreateState {}
// ignore: must_be_immutable
class succes extends OrderCreateState {
   List<OrderShow> ordersList;
  succes({
    required this.ordersList,
  });
}
class error extends OrderCreateState{}
class loading extends OrderCreateState{}
class offline extends OrderCreateState{}
class sendOrder extends OrderCreateBloc{}