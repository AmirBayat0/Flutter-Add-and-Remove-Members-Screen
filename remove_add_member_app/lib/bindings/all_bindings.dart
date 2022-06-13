import 'package:get/get.dart';

import '../controller/members_controller.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MembersController());
  }
}
