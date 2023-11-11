import 'package:cp_project/controller/state_controller.dart';
import 'package:get/instance_manager.dart';

class initialBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().put(StateController());
  }
}
