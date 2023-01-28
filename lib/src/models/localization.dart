class Localization {
  const Localization({
    required this.processingTitle,
    required this.processingContent,
    required this.successTitle,
    required this.onConfirmText,
    required this.onCancelText,
    required this.errorTitle,
    required this.failedTitle,
    required this.infoTitle,
    required this.errorContent,
    required this.failedContent,
    required this.infoContent,
    required this.successContent,
  });

  final String processingTitle;
  final String processingContent;
  final String successTitle;
  final String onConfirmText;
  final String onCancelText;
  final String errorTitle;
  final String failedTitle;
  final String infoTitle;
  final String errorContent;
  final String infoContent;
  final String successContent;
  final String failedContent;
}
