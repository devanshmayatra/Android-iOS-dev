import 'dart:convert';
import 'dart:math';
import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactViewModel extends ChangeNotifier {
  final _nameTextController = TextEditingController();
  final _numberTextController = TextEditingController();
  final _emailTextController = TextEditingController();

  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get numberTextController => _numberTextController;
  TextEditingController get emailTextController => _emailTextController;

  List<Map<String, String>> _contacts = [];

  List<Map<String, String>> get contacts => _contacts;

  set contacts(list) {
    _contacts = list;
  }

  Future<void> addTodoItem(String name, String number, String email) async {
    final prefs = await SharedPreferences.getInstance();

    if (name != "" || number != "" || email != "") {
      _contacts.add({'name': name, 'number': number, 'email': email});
      _nameTextController.clear();
      _numberTextController.clear();
      _emailTextController.clear();
    }
    prefs.setStringList(
        'contacts', _contacts.map((contact) => jsonEncode(contact)).toList());
    contacts = prefs.getStringList('contacts');
    notifyListeners();
  }

  Future<void> removeTodoItem(int index) async {
    final prefs = await SharedPreferences.getInstance();
    _contacts.removeAt(index);
    prefs.setStringList(
        'contacts', _contacts.map((contact) => jsonEncode(contact)).toList());
    contacts = prefs.getStringList('contacts');

    notifyListeners();
  }

  Future<void> updateContact(
      int index, String name, String number, String email) async {
    final prefs = await SharedPreferences.getInstance();
    if (name == "") {
      _contacts[index]['name'];
    } else {
      _contacts[index]['name'] = name;
    }
    if (number == "") {
      _contacts[index]['number'];
    } else {
      _contacts[index]['number'] = number;
    }
    if (email == "") {
      _contacts[index]['email'];
    } else {
      _contacts[index]['email'] = email;
    }

    prefs.setStringList(
        'contacts', _contacts.map((contact) => jsonEncode(contact)).toList());

    contacts = prefs.getStringList('contacts');

    _nameTextController.clear();
    _numberTextController.clear();
    _emailTextController.clear();
    notifyListeners();
  }

  // Future<List> getContacts() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final data = prefs.getStringList('contacts');
  //   if (data == null) return [];
  //   return data.map((contact) => jsonDecode(contact)).toList();
  // }
}
