class DateTimeHelper{
  static String formatTimeAgo(String inputDatetimeStr) {

    DateTime inputDatetime = DateTime.parse(inputDatetimeStr);

    Duration difference = DateTime.now().toUtc().difference(inputDatetime.toUtc());

    if (difference.inSeconds < 10) {
      return 'Just now';
    }else if(difference.inSeconds  < 60) {
      return '${difference.inSeconds} s';
    }
    else if(difference.inMinutes < 60) {
      return '${difference.inMinutes} m';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} h';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} d';
    } else {
      int weeks = (difference.inDays / 7).floor();
      return '$weeks w';
    }
  }
}