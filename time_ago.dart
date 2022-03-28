class TimeAgo {
  //int time is in Epoch Unix time formate
  //dateInNumbers is a condition in which you want your timestamp:
  //if dateInNumbers is set to true then notification arrived as {1 day ago ,3 hours ago, 65 min ago, 21 sec ago} and so on and so on.
  //if dateInNumbers is set to false then notification arrived as  Yesterday , An hour ago , seconds ago

  static String timeAgoSinceEpochDate(int time, {bool dateInNumbers = true}) {
    // convert epoch date to human-readable date
    var notificationTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);

    // current time
    final currentTime = DateTime.now();
    // difference between these two dates
    final difference = currentTime.difference(notificationTime);
    // don't worry about .difference() it's a pre defined method and will take care the rest of the operation for us
    // with .difference() method now you can breakdown dates difference into days,hours ,mins, sec.

    // for years

    // if number of year is larger then 1
    if ((difference.inDays / 365).floor() >= 2) {
      return "${(difference.inDays / 365).floor()} years ago";
    } else if ((difference.inDays / 365).floor() >= 1) {
      return (dateInNumbers) ? '1 year ago' : 'Last year';
    }
    // for weeks
    else if ((difference.inDays / 7).floor() >= 1) {
      return (dateInNumbers) ? '1 week ago' : 'Last week';
    }
    // for days
    else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (dateInNumbers) ? '1 day ago' : 'Yesterday';
    }
    // for hours
    else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (dateInNumbers) ? '1 hour ago' : 'An hour ago';
    }
    // for minutes
    else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (dateInNumbers) ? '1 minute ago' : 'A minute ago';
    }
    // for seconds
    else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    }
    // if notification just arrived
    else {
      return 'Just now';
    }
  }
}
