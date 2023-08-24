import 'package:flutter/material.dart';
import 'package:service/features/trackstatus/model.dart';


final trackOrderList = [
  TrackOrderModal(
      icon: Icons.directions_walk,
      title: "On the way",
      subtitle: "Our Team member are on the way",
      time: "08:00 \n Pm"),
  TrackOrderModal(
      icon: Icons.person,
      title: "In process",
      subtitle: "Team members had start working",
      time: "09:50 \n Pm"),
  TrackOrderModal(
      icon: Icons.payment,
      
      title: "Part change required",
      subtitle: "Part of the machine has been deteriorated",
      time: "11:30 \n Pm"),
  TrackOrderModal(
      icon: Icons.receipt,
      title: "Part replacement under warranty",
      subtitle: "Part of the machine is under warranty",
      time: "02:15 \n Pm"),
  TrackOrderModal(
      icon: Icons.receipt,
      title: "Worked completed",
      subtitle: "__",
      time: "__"),
  // TrackOrderModal(
  //     icon: Icons.receipt,
  //     title: "Not served",
  //     subtitle: "We have received your order",
  //     time: "02:15 Pm"),
];
