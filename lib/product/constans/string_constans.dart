import 'package:flutter/material.dart';

@immutable
class StringConstans {
  const StringConstans._();

  static const String appBarTitle = 'SpaceX Latest Launch';
  static const String refleshError = 'Error while refreshing: ';
  static const String refleshed = 'Refreshed';

  static const String crewMember = 'Crew Member';
  static const String baseUrl = "https://api.spacexdata.com/v5/launches/latest";

  static const String baseUrlNext =
      "https://api.spacexdata.com/v5/launches/upcoming";

  static const String failLoadData = "Failed to load data";

  static const String couldNotData = 'Could not launch';

  static const String titleWiki = 'Wikipedia :';

  static const String buttonTextWiki = 'click to wikipedia';
  static const String titleYoutube = 'Youtube :';

  static const String buttonTextYoutube = 'click to watch on youtube';
  static const String titleReddit = 'Reddit :';

  static const String buttonTextReddit = 'click to details';
  static const String flightNumber = 'Flight Number: ';

  static const String date = 'Date : ';
  // static const String spacemanImage = 'assets/images/spaceman.png';

  static const String errorLoadData = 'Error loading data';
  static const String detaildValueNot =
      'SpaceX s 20th and final Crew Resupply Mission under the original NASA CRS contract, this mission brings essential supplies to the International Space Station using SpaceX\'s reusable Dragon spacecraft. It is the last scheduled flight of a Dragon 1 capsule. (CRS-21 and up under the new Commercial Resupply Services 2 contract will use Dragon 2.) The external payload for this mission is the Bartolomeo ISS external payload hosting platform. Falcon 9 and Dragon will launch from SLC-40, Cape Canaveral Air Force Station and the booster will land at LZ-1. The mission will be complete with return and recovery of the Dragon capsule and down cargo.';
  //static const String detaildValueNot = "Detail Values Not Found";
}
