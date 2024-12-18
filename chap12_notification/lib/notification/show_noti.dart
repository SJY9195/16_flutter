
// 알림 설정
import 'package:chap12_notification/notification/init_noti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

showNotification() async{
  // 안드로이드 알림 설정
  // 특정 알림 채널에 등록을 해 주어야 한다..
  var androidDetails = AndroidNotificationDetails(
      "test_id",
      "테스트채널",
      priority: Priority.max,
      color: Colors.black,
  );
  // 애플
  var iosDetails = DarwinNotificationDetails(
    presentAlert: true, // 알림이 표시될 때 팝업을 보여줄지
    presentBadge: true, // 아이콘
    presentSound: true,
  );

  notifications.show(1, '전자문서 안내', ' KB국민은행 윤*중님, KB 국민 인증서 도착 알림', NotificationDetails(android: androidDetails, iOS: iosDetails),
  payload: "test_payload");
}