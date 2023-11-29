import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetWorkInfo{}

class _NetWorkInfoImpl extends NetWorkInfo{
  final internetConnectionChecker=InternetConnectionChecker().onStatusChange.listen((event) { });

}