

import 'package:graduation_project/features/community/data/models/Data.dart';
import 'package:graduation_project/features/community/data/models/get_comments_model/Comments.dart';

class PostDetailsTransfer
{

  final Data data;
  final Comments commentsModel;

  PostDetailsTransfer({required this.data, required this.commentsModel});
}