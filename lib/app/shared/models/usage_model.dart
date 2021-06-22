class UsageModel {
  String packageName;
  String firstTimeStamp;
  String lastTimeStamp;
  String lastTimeUsed;
  String totalTimeInForeground;

  UsageModel(
      {required this.firstTimeStamp,
      required this.lastTimeStamp,
      required this.packageName,
      required this.lastTimeUsed,
      required this.totalTimeInForeground});
}
