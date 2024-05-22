import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:myapp/models/data_dashboard.dart';



class HomeAdminController extends GetxController {

  final _data =[
    DataDashboard(name: 'Toures', value: "5"),
    DataDashboard(name: 'Usuarios', value: "5"),
    DataDashboard(name: 'Reservas', value: "5"),
    DataDashboard(name: 'Rechazadas', value: "5"),
 ];

 List<DataDashboard>  get data => _data; 


}