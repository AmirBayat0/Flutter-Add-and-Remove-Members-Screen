import 'package:flutter/material.dart';

import 'model/user_model.dart';

memberComponent({required MembersModel user}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          SizedBox(
              width: 60,
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  user.imageAd,
                  fit: BoxFit.cover,
                ),
              )),
          // ignore: prefer_const_constructors
          SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(user.name,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            const SizedBox(
              height: 5,
            ),
            Text(user.userName, style: const TextStyle(color: Colors.grey)),
          ])
        ]),
      ],
    ),
  );
}
