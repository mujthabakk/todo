import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final greetingProvider = Provider.autoDispose<String>((ref) => "Hello World");

final counterProvider = StateProvider((ref) => 0);

final icons = Provider((ref) => Icons.face);




final todolist =StateProvider<List>((ref) => []);



