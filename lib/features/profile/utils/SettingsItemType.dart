import 'package:flutter/material.dart';

enum SettingsItemType{
  LANGUAGE,
  CURRENCY,
  APPEARNCE,
  PREFERENCE,
  ABOUT_US;

  IconData getIcon(){
      switch(this){
        case LANGUAGE :
          return Icons.language;
        case CURRENCY:
          return Icons.monetization_on_outlined;
        case APPEARNCE:
          return Icons.brightness_medium_outlined;
        case PREFERENCE:
          return Icons.tune;
        case ABOUT_US:
          return Icons.tune;
      }
  }

  String getTitle(){
    switch(this){
      case LANGUAGE :
        return 'Language';
      case CURRENCY:
        return 'currency';
      case APPEARNCE:
        return 'appearance';
      case PREFERENCE:
        return 'preference';
      case ABOUT_US:
        return 'about us';
    }
  }

  String getTrailingText(){
      switch(this){
        case LANGUAGE :
          return 'English';
        case CURRENCY:
          return 'USD';
        case APPEARNCE:
          return 'Appearance';
        case PREFERENCE:
          return 'Customize';
        case ABOUT_US:
          return 'v1.2.3';
      }
  }
  Function getOnTap(){
    switch(this){
      case LANGUAGE :
        return () => {};
      case CURRENCY:
        return () => {};
      case APPEARNCE:
        return () => {};
      case PREFERENCE:
        return () => {};
      case ABOUT_US:
        return () => {};
    }
  }
}
