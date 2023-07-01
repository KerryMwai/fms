class FeedUsageReportModel {
  final String livestockId;
  final String feedType;
  final double feedQuantity;
  final String feedFrequency;
  final String feedingDuration;
  final double feedCost;
  final String feedSource;
  final String feedingNotes;

  FeedUsageReportModel({
    required this.livestockId,
    required this.feedType,
    required this.feedQuantity,
    required this.feedFrequency,
    required this.feedingDuration,
    required this.feedCost,
    required this.feedSource,
    required this.feedingNotes,
  });
}