/// description:
/// project: travel_diary
/// @package: comments
/// @author: dammyololade
/// created on: 07/05/2020
class CommentModel {
  String userDocId, userName, comment, date, journalId;
  double ratings;

  CommentModel({this.userDocId, this.userName, this.comment, this.date,
    this.journalId, this.ratings});

  Map<String, dynamic> toMap() {
    return {
    };
  }
}
