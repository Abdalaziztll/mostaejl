part of 'order_create_bloc.dart';

@immutable
sealed class OrderCreateEvent {}
class submitedOrder extends OrderCreateEvent{}

