
import 'package:flutter/material.dart';
// import 'package:swasthya_setu/utils/colours.dart';

TextField getTextField(String inputName,double size,TextEditingController _controller) {
  return TextField(
    cursorHeight: size,
    controller: _controller,
    decoration: InputDecoration(
        label: Text(inputName),
        filled: true,
        
        focusColor: Colors.grey.shade200,
        fillColor: Colors.grey.shade200,
        border: const OutlineInputBorder()),
  );
}


TextField getTextNumberField(String inputName,double size,TextInputType type ,TextEditingController _controller) {
  return TextField(keyboardType: type,
    cursorHeight: size,
    controller: _controller,
    decoration: InputDecoration(
        label: Text(inputName),
        filled: true,
         focusColor: Colors.grey.shade200,
        fillColor: Colors.grey.shade200,
        border: const OutlineInputBorder()),
  );
}


TextField getReadTextField(String inputName,double size,String profileDetail) {
  return TextField(
    readOnly: true,
    cursorHeight: size,
    decoration: InputDecoration(
        label: Text(profileDetail),
        filled: true,
        hintText: profileDetail,
        focusColor: Colors.grey.shade200,
        fillColor: Colors.grey.shade200,
        border: const OutlineInputBorder()),
  );
}