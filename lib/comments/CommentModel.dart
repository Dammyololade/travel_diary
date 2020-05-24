import 'package:traveldiary/SessionManager.dart';

/// description:
/// project: travel_diary
/// @package: comments
/// @author: dammyololade
/// created on: 07/05/2020
class CommentModel {
  static const String cUserName = "userName";
  static const String cComment = "comment";
  static const String cDate = "date";
  static const String cUserId = "userId";
  static const String cJournalId = "journalId";
  static const String cRatings = "ratings";
  String userDocId, userName, comment, date, journalId;
  double ratings;

  CommentModel({this.userDocId, this.userName, this.comment, this.date,
    this.journalId, this.ratings});

  Map<String, dynamic> toMap() {
    return {
      cComment: comment,
      cDate: DateTime.now(),
      cUserId: SessionManager.documentId,
      cJournalId: journalId,
      cRatings: ratings
    };
  }
}
