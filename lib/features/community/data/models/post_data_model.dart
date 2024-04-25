

class PostDataModel
{
  final String owner;
  final String userName;
  final int hours;
  final String content;
  final int commentNumber;
  final int loveNumber;
  final int retweetNumber;
  final String postOwnerPhoto;
   bool heartIsActive;
   bool retweetIsActive;

  PostDataModel({this.heartIsActive=false, this.retweetIsActive=false,required this.postOwnerPhoto,required this.owner, required this.userName, required this.hours, required this.content, required this.commentNumber, required this.loveNumber, required this.retweetNumber});





}