/// Application-wide constants for PhotoForge.
class AppConstants {
  AppConstants._();

  // App info
  static const String appName = 'PhotoForge';
  static const String appVersion = '1.0.0';
  static const String bundleId = 'com.photoforge.app';

  // Navigation routes
  static const String routeHome = '/home';
  static const String routeEdit = '/edit';
  static const String routeWatermark = '/watermark';
  static const String routeProjects = '/projects';
  static const String routeSettings = '/settings';

  // SharedPreferences keys
  static const String prefThemeMode = 'pref_theme_mode';
  static const String prefDefaultExportFormat = 'pref_default_export_format';
  static const String prefDefaultQuality = 'pref_default_quality';
  static const String prefDefaultOpacity = 'pref_default_opacity';
  static const String prefSaveLocation = 'pref_save_location';

  // Default values
  static const int defaultExportQuality = 90;
  static const double defaultWatermarkOpacity = 0.7;
  static const String defaultExportFormat = 'jpeg';

  // UI
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusXLarge = 24.0;

  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  static const Duration animFast = Duration(milliseconds: 150);
  static const Duration animNormal = Duration(milliseconds: 250);
  static const Duration animSlow = Duration(milliseconds: 400);

  // Image processing
  static const int maxImageDimension = 4096;
  static const int thumbnailSize = 256;
}
