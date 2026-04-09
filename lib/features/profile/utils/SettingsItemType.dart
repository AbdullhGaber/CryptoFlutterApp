import 'package:flutter/material.dart';
import '../../../../core/localization/loc.dart';

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
        return Loc.profile.language;
      case CURRENCY:
        return Loc.profile.currency;
      case APPEARNCE:
        return Loc.profile.appearance;
      case PREFERENCE:
        return Loc.profile.preference;
      case ABOUT_US:
        return Loc.profile.aboutUs;
    }
  }

  String getTrailingText(){
      switch(this){
        case LANGUAGE :
          return Loc.profile.english;
        case CURRENCY:
          return Loc.profile.usd;
        case APPEARNCE:
          return Loc.profile.appearance;
        case PREFERENCE:
          return Loc.profile.customize;
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
