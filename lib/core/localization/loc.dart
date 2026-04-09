import 'package:get_it/get_it.dart';
import 'values/loc_app.dart';
import 'values/loc_auth.dart';
import 'values/loc_home.dart';
import 'values/loc_market.dart';
import 'values/loc_onboarding.dart';
import 'values/loc_wallet.dart';
import 'values/loc_activity.dart';
import 'values/loc_profile.dart';

class Loc {
  static final app = GetIt.I.get<AppLoc>();
  static final auth = GetIt.I.get<AuthLoc>();
  static final onboarding = GetIt.I.get<OnboardingLoc>();
  static final home = GetIt.I.get<HomeLoc>();
  static final market = GetIt.I.get<MarketLoc>();
  static final wallet = GetIt.I.get<WalletLoc>();
  static final activity = GetIt.I.get<ActivityLoc>();
  static final profile = GetIt.I.get<ProfileLoc>();
}