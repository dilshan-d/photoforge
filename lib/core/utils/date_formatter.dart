/// Date formatting utilities for PhotoForge.
class DateFormatter {
  DateFormatter._();

  /// Returns a human-friendly relative date string.
  /// e.g. "Today", "Yesterday", "3 days ago", "Nov 5"
  static String relative(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inDays == 0) return 'Today';
    if (diff.inDays == 1) return 'Yesterday';
    if (diff.inDays < 7) return '${diff.inDays} days ago';

    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    final month = months[date.month - 1];
    final day = date.day;

    if (date.year == now.year) return '$month $day';
    return '$month $day, ${date.year}';
  }

  /// Returns a short time string, e.g. "3:45 PM"
  static String shortTime(DateTime date) {
    final hour = date.hour;
    final minute = date.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour % 12 == 0 ? 12 : hour % 12;
    return '$displayHour:$minute $period';
  }

  /// Returns a full date string, e.g. "November 5, 2024"
  static String fullDate(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
