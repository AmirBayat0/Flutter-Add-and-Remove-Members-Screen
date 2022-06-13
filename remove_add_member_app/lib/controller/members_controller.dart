import 'package:get/get.dart';

import '../model/user_model.dart';

class MembersController extends GetxController {
  /// All Member List
  RxList<MembersModel> members = [
    MembersModel(
      "Wentworth Miller",
      "@Miller",
      "assets/images/wentworth.jpg",
    ),
    MembersModel(
      "Dominic Purcellr",
      "@Purcellr",
      "assets/images/Dominic.png",
    ),
    MembersModel(
      "Amaury Nolasco",
      "@Nolasco",
      "assets/images/Nolasco.jpg",
    ),
    MembersModel(
      "Sarah Wayne Callies",
      "@Callies",
      "assets/images/sara.jpg",
    ),
    MembersModel(
      "Robert Knepper",
      "@Knepper",
      "assets/images/robert.jpg",
    ),
    MembersModel(
      "Paul Adelstein",
      "@Adelstein",
      "assets/images/adel.jpg",
    ),
    MembersModel(
      "Rockmond Dunbar",
      "@Dunbar",
      "assets/images/Rockmond.png",
    ),
    MembersModel(
      "Wade Williams",
      "@Williams",
      "assets/images/wade.jpg",
    ),
    MembersModel(
      "Jodi Lyn O'Keefe",
      "@OKeefe",
      "assets/images/jody.jpg",
    ),
    MembersModel(
      "William Fichtner",
      "@Fichtner",
      "assets/images/wiliam.jpg",
    ),
  ].obs;

  /// Selected Member List
  RxList selectedMembers = [].obs;

  /// Selected index of member
  var isMemberSelected = 0.obs;

  /// onInit
  @override
  void onInit() {
    members.sort((a, b) => a.name.compareTo(b.name));
    super.onInit();
  }

  /// For Sorting All member List
  sortList(int val) {
    if (val == 1) {
      return members.sort((a, b) => a.name.compareTo(b.name));
    }
    return members.sort((a, b) => a.userName.compareTo(b.userName));
  }

  ///
  void changeIndexOfSelectedMember(int index) {
    isMemberSelected.value = index;
  }

  ///
  bool isEqual(int index) {
    if (isMemberSelected.value == index) {
      return true;
    }
    return false;
  }

  /// For Adding Member
  void addMember({
    required index,
    required name,
    required userName,
    required imageAd,
  }) {
    var contain =
        selectedMembers.where((element) => element.imageAd == imageAd);
    if (contain.isEmpty) {
      selectedMembers.add(MembersModel(name, userName, imageAd));
      members.removeAt(index);
      selectedMembers.sort((a, b) => a.name.compareTo(b.name));
    }
  }

  /// For removing  Member
  void removeMember({
    required index,
    required name,
    required userName,
    required imageAd,
  }) {
    var contain =
        selectedMembers.where((element) => element.imageAd == imageAd);
    if (contain.isNotEmpty) {
      selectedMembers.removeAt(index);
      members.add(MembersModel(name, userName, imageAd));
      members.sort((a, b) => a.name.compareTo(b.name));
    }
  }


  /// For removing all member from the ALl member List
  deleteAllMemberFromList() {
    selectedMembers.value = [];
    members.value = [
      MembersModel(
        "Wentworth Miller",
        "@Miller",
        "assets/images/wentworth.jpg",
      ),
      MembersModel(
        "Dominic Purcellr",
        "@Purcellr",
        "assets/images/Dominic.png",
      ),
      MembersModel(
        "Amaury Nolasco",
        "@Nolasco",
        "assets/images/Nolasco.jpg",
      ),
      MembersModel(
        "Sarah Wayne Callies",
        "@Callies",
        "assets/images/sara.jpg",
      ),
      MembersModel(
        "Robert Knepper",
        "@Knepper",
        "assets/images/robert.jpg",
      ),
      MembersModel(
        "Paul Adelstein",
        "@Adelstein",
        "assets/images/adel.jpg",
      ),
      MembersModel(
        "Rockmond Dunbar",
        "@Dunbar",
        "assets/images/Rockmond.png",
      ),
      MembersModel(
        "Wade Williams",
        "@Williams",
        "assets/images/wade.jpg",
      ),
      MembersModel(
        "Jodi Lyn O'Keefe",
        "@OKeefe",
        "assets/images/jody.jpg",
      ),
      MembersModel(
        "William Fichtner",
        "@Fichtner",
        "assets/images/wiliam.jpg",
      ),
    ].obs;
  }
}
