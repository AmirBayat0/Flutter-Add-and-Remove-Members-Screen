import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';

import '../components.dart';
import '../controller/members_controller.dart';
import '../utils/colors.dart';
import '../utils/constanst.dart';
import '../utils/strings.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  /////////////////////////////////////
  //@CodeWithFlexz on Instagram
  //
  //AmirBayat0 on Github
  //Programming with Flexz on Youtube
  /////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    final MembersController membersController = Get.find<MembersController>();
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      appBar: MyAppBar(
        textTheme: textTheme,
        membersController: membersController,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            ///-----------------------------------------------
            /// SELECTED MEMBER SECTION
            SelectedMembersSection(
              membersController: membersController,
              textTheme: textTheme,
            ),

            ///-----------------------------------------------
            /// MIDDLE MEMBERS TEXT
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(MyStrings.members, style: textTheme.headline4),
            ),

            ///-----------------------------------------------
            /// ALL MEMBERS SECTION
            MembersListSection(
              membersController: membersController,
              textTheme: textTheme,
            )
          ],
        ),
      ),
    );
  }
}

//-----------------------------------------------
/// ALL MEMBERS
class MembersListSection extends StatelessWidget {
  const MembersListSection({
    Key? key,
    required this.membersController,
    required this.textTheme,
  }) : super(key: key);

  final MembersController membersController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: screenWidth,
          height: screenHeight / 1.553,
          child: membersController.members.isEmpty
              ? Center(
                  child: FadeInUp(
                      from: 30,
                      child: Text(MyStrings.allMembers,
                          style: textTheme.headline3)),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: membersController.members.length,
                  itemBuilder: ((
                    context,
                    index,
                  ) {
                    var currentMember = membersController.members[index];
                    return FadeIn(
                      duration: const Duration(milliseconds: 500),
                      child: GestureDetector(
                        onTap: () {
                          membersController.addMember(
                              name: currentMember.name,
                              userName: currentMember.userName,
                              imageAd: currentMember.imageAd,
                              index: index);
                        },
                        child: memberComponent(
                            user: membersController.members[index]),
                      ),
                    );
                  })),
        ));
  }
}

///-----------------------------------------------
/// SELECTED MEMBER SECTION
class SelectedMembersSection extends StatelessWidget {
  const SelectedMembersSection({
    Key? key,
    required this.membersController,
    required this.textTheme,
  }) : super(key: key);

  final MembersController membersController;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth / 1.1,
      height: screenHeight / 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: MyColors.memberSectionBgColor,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Obx(() => Visibility(
                  visible:
                      membersController.selectedMembers.isEmpty ? false : true,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FadeInDown(
                        from: 30,
                        child: Text(
                          MyStrings.selectedMembers,
                          style: textTheme.headline2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 89),
                        child: FadeInRight(
                          child: GestureDetector(
                              onTap: () {
                                _cupertinoPopup(context);
                              },
                              child: const Icon(
                                Icons.delete_forever,
                                color: MyColors.titleTextColor,
                              )),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          SizedBox(
            width: screenWidth / 1.1,
            height: screenHeight / 9,
            child: Obx(() => membersController.selectedMembers.isEmpty
                ? Center(
                    child: FadeInUp(
                      from: 30,
                      child: Text(
                        MyStrings.noMembers,
                        style: textTheme.headline3,
                      ),
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: membersController.selectedMembers.length,
                    itemBuilder: ((context, index) {
                      var currentMember =
                          membersController.selectedMembers[index];
                      return FadeIn(
                        duration: const Duration(milliseconds: 500),
                        child: GestureDetector(
                          onTap: () {
                            membersController
                                .changeIndexOfSelectedMember(index);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            width: screenWidth / 5,
                            height: screenHeight / 9.5,
                            child: Obx(() =>
                                Stack(alignment: Alignment.center, children: [
                                  AnimatedContainer(
                                    width: membersController.isEqual(index)
                                        ? 70
                                        : 65,
                                    height: membersController.isEqual(index)
                                        ? 70
                                        : 65,
                                    duration: const Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                membersController.isEqual(index)
                                                    ? Colors.white
                                                    : Colors.transparent,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(
                                            membersController.isEqual(index)
                                                ? 35
                                                : 32),
                                        image: DecorationImage(
                                            image: AssetImage(membersController
                                                .selectedMembers[index]
                                                .imageAd),
                                            fit: BoxFit.cover)),
                                  ),
                                  membersController.isEqual(index)
                                      ? Positioned(
                                          right: 3,
                                          top: 3,
                                          child: GestureDetector(
                                            onTap: () {
                                              membersController.removeMember(
                                                  name: currentMember.name,
                                                  userName:
                                                      currentMember.userName,
                                                  imageAd:
                                                      currentMember.imageAd,
                                                  index: index);
                                            },
                                            child: AnimatedContainer(
                                              width: 28,
                                              height: 28,
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              decoration: const BoxDecoration(
                                                  color: MyColors.bgColor,
                                                  shape: BoxShape.circle),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.close,
                                                  size: 15,
                                                  color:
                                                      MyColors.titleTextColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container()
                                ])),
                          ),
                        ),
                      );
                    }))),
          )
        ],
      ),
    );
  }

  /// show Cupertino Modal Popup
  Future<void> _cupertinoPopup(BuildContext context) {
    return showCupertinoModalPopup<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        insetAnimationCurve: Curves.fastOutSlowIn,
        title: const Text('Alert!'),
        content: const Text(
            'With this action, you remove all selected members, do you really want?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              membersController.deleteAllMemberFromList();
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }
}

///-----------------------------------------------
/// APP BAR
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    required this.textTheme,
    required this.membersController,
  }) : super(key: key);

  final TextTheme textTheme;
  final MembersController membersController;

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: Text(
        MyStrings.appBarTitle,
        style: textTheme.headline1,
      ),
      actions: [_popupMenue()],
    );
  }

  /// POP UP MENUE BUTTON
  PopupMenuButton<int> _popupMenue() {
    return PopupMenuButton<int>(
      onSelected: (val) {
        membersController.sortList(val);
      },
      icon: const Icon(Icons.sort_by_alpha, color: Colors.white),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Text(
            "By name",
            style: TextStyle(color: MyColors.titleTextColor),
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text(
            "By user name",
            style: TextStyle(color: MyColors.titleTextColor),
          ),
        ),
      ],
      offset: const Offset(-20, 40),
      color: const Color.fromARGB(255, 45, 45, 45),
      elevation: 2,
    );
  }
}
