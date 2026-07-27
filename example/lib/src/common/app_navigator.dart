import 'package:flutter/widgets.dart';

/// Global navigator key so non-widget code (e.g. the Apphud deep link handler
/// in [PurchaseBloc]) can present dialogs without a local [BuildContext].
final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();
