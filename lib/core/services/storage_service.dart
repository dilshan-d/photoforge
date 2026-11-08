import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

/// Thin wrapper around [SharedPreferences] for storing user preferences.
/// Call [init] once at app startup before accessing any values.
class StorageService {
  StorageService._();

  static late SharedPreferences _prefs;

  /// Must be called before the app starts (in [main]).
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ── Theme ──────────────────────────────────────────────────────────────────

  static String getThemeMode() =>
      _prefs.getString(AppConstants.prefThemeMode) ?? 'dark';

  static Future<void> setThemeMode(String mode) =>
      _prefs.setString(AppConstants.prefThemeMode, mode);

  // ── Export ─────────────────────────────────────────────────────────────────

  static String getDefaultExportFormat() =>
      _prefs.getString(AppConstants.prefDefaultExportFormat) ??
      AppConstants.defaultExportFormat;

  static Future<void> setDefaultExportFormat(String format) =>
      _prefs.setString(AppConstants.prefDefaultExportFormat, format);

  static int getDefaultQuality() =>
      _prefs.getInt(AppConstants.prefDefaultQuality) ??
      AppConstants.defaultExportQuality;

  static Future<void> setDefaultQuality(int quality) =>
      _prefs.setInt(AppConstants.prefDefaultQuality, quality);

  // ── Watermark ──────────────────────────────────────────────────────────────

  static double getDefaultOpacity() =>
      _prefs.getDouble(AppConstants.prefDefaultOpacity) ??
      AppConstants.defaultWatermarkOpacity;

  static Future<void> setDefaultOpacity(double opacity) =>
      _prefs.setDouble(AppConstants.prefDefaultOpacity, opacity);

  // ── Save location ──────────────────────────────────────────────────────────

  static String? getSaveLocation() =>
      _prefs.getString(AppConstants.prefSaveLocation);

  static Future<void> setSaveLocation(String path) =>
      _prefs.setString(AppConstants.prefSaveLocation, path);
}
