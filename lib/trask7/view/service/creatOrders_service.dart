import 'package:dio/dio.dart';
import 'package:herry_up/core/config/dependency_injection.dart';
import 'package:herry_up/core/data/service/base_service.dart';
import 'package:herry_up/trask7/view/model/order_list.dart';
import 'package:shared_preferences/shared_preferences.dart';



  
  

class auth extends BaseService {
 
 Future orders(OrderShow order) async {
    
    try{
          Response response= await dio.post(OrderSend,data: order.toJson());
    if(response.statusCode == 200){
    String token =response.data['token'];
    storage.get<SharedPreferences>().setString('token', token);
    return true;
   }
   else{
    print('Error');
    return false;
   }
    }
    catch(e){
      throw e;
    }

   
  }

}
