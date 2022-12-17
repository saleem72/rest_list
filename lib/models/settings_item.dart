//

enum SettingsItem {
  account,
  restaurant,
  display,
  offers,
  plans,
  mySubscription,
  logs,
  currency,
  policy;

  String get title {
    switch (this) {
      case SettingsItem.account:
        return 'Account';
      case SettingsItem.restaurant:
        return 'Restaurant';
      case SettingsItem.display:
        return 'Display';
      case SettingsItem.offers:
        return 'Manage offers';
      case SettingsItem.plans:
        return 'Subscription plans';
      case SettingsItem.mySubscription:
        return 'My subscription';
      case SettingsItem.logs:
        return 'Logs';
      case SettingsItem.currency:
        return 'Currency';
      case SettingsItem.policy:
        return 'Our policy';
    }
  }
}
