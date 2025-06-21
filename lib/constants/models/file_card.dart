/// A model representing the information shown in a single file card.
class FileCardData {
  const FileCardData({
    required this.fileName,
    required this.size,
    required this.description,
    required this.typeLabel,
    required this.isPreviewable,
    required this.uploadedBy,
    required this.uploadDate,
  });

  final String fileName; // e.g. "invoice_q1_2025.pdf"
  final String size; // e.g. "1.2 MB"
  final String description; // e.g. "Quarter-1 invoice"
  final String typeLabel; // e.g. "PDF", "Image", ...
  final bool isPreviewable; // toggles the little subtitle in your card
  final String uploadedBy; // e.g. "Alice Müller"
  final DateTime uploadDate; // exact timestamp
}
