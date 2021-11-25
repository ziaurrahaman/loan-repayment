import 'package:demo_loan_repayment_app/controllers/theme_controller.dart';
import 'package:demo_loan_repayment_app/models/home_page_menu_model.dart';
import 'package:demo_loan_repayment_app/views/home_page.dart';
import 'package:flutter/material.dart';

var home_page_menus = [
  HomePageMenuModel(
      nameOfTheMenu: 'Add Somity Member',
      menuIcon: Icon(
        Icons.person_add_outlined,
        size: 48,
        color: Colors.white,
      )),
  HomePageMenuModel(
      nameOfTheMenu: 'Field Officer History',
      menuIcon: Icon(
        Icons.nordic_walking_outlined,
        size: 48,
        color: Colors.white,
      )),
  HomePageMenuModel(
      nameOfTheMenu: 'Somity Meeting',
      menuIcon: Icon(
        Icons.groups_outlined,
        size: 48,
        color: Colors.white,
      )),
  HomePageMenuModel(
      nameOfTheMenu: 'Attendance',
      menuIcon: Icon(
        Icons.fact_check_outlined,
        size: 48,
        color: Colors.white,
      )),
  HomePageMenuModel(
      nameOfTheMenu: 'Profile Management',
      menuIcon: Icon(
        Icons.manage_accounts,
        size: 48,
        color: Colors.white,
      )),
  HomePageMenuModel(
      nameOfTheMenu: 'E Pass book',
      menuIcon: Icon(
        Icons.menu_book,
        size: 48,
        color: Colors.white,
      )),
  HomePageMenuModel(
    nameOfTheMenu: 'Apply Loan',
    menuIcon: Icon(Icons.mode_rounded, size: 48, color: Colors.white),
  ),
  HomePageMenuModel(
    nameOfTheMenu: 'Offline Transaction',
    menuIcon: Icon(Icons.history, size: 48, color: Colors.white),
  ),
];
