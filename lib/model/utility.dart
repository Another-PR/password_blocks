
import 'package:flutter/services.dart';

Future fetchUserPasswords(){
  var data = rootBundle.loadString('assets/jsons/sample.json');
  return data;
}