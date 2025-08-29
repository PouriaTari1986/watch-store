String formatTime(int sec) {
  String resultFormat;

  int hours = sec ~/ 3600;
  int min = sec~/60;
  int seconds = sec%60;
  String hour = hours.toString().padLeft(2,'0');
  String minStr = min.toString().padLeft(2,'0');
  String secStr = seconds.toString().padLeft(2,'0');
  if (sec > 3600) {
    resultFormat = "$hour:$minStr:$secStr";
  } else {
    resultFormat = "$min:$secStr";
  }
  return resultFormat;

}
