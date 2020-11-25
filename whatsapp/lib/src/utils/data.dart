import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp/src/utils/user.dart';

final random = Random(TimeOfDay.now().hour);

const CURRENT_USER = User(
  name: 'You',
  image: 'assets/images/me.jpg',
  statusCount: 2,
);

final ALL_USERS = [
  User(
    name: 'Amir Taheri',
    image: 'assets/images/amir_taheri.jpg',
    statusCount: 3,
  ),
  User(
    name: 'Andre Furtado',
    image: 'assets/images/andre_furtado.jpg',
    statusCount: 5,
  ),
  User(
    name: 'Autumn Goodman',
    image: 'assets/images/autumn_goodman.jpg',
    statusCount: 1,
  ),
  User(
    name: 'Clinton Naik',
    image: 'assets/images/clinton_naik.jpg',
    statusCount: 4,
  ),
  User(
    name: 'Dami Adebayo',
    image: 'assets/images/dami_adebayo.jpg',
    statusCount: 7,
  ),
  User(
    name: 'Li Shanting',
    image: 'assets/images/li_shanting.jpg',
    statusCount: 3,
  ),
  User(
    name: 'Nikolay Tarashchenko',
    image: 'assets/images/nikolay_tarashchenko.jpg',
    statusCount: 2,
  ),
  User(
    name: 'Oladimeji Odunsi',
    image: 'assets/images/oladimeji_odunsi.jpg',
    statusCount: 12,
  ),
  User(
    name: 'Simon Connellan',
    image: 'assets/images/simon_connellan.jpg',
    statusCount: 1,
  ),
  User(
    name: 'Tyler Nix',
    image: 'assets/images/tyler_nix.jpg',
    statusCount: 5,
  ),
]..shuffle(random);
