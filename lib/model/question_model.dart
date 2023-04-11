class Question {
  List<String>? tags;
  Owner? owner;
  bool? isAnswered;
  int? viewCount;
  int? answerCount;
  int? score;
  int? lastActivityDate;
  int? creationDate;
  int? lastEditDate;
  int? questionId;
  String? contentLicense;
  String? link;
  String? title;

  Question(
      {this.tags,
      this.owner,
      this.isAnswered,
      this.viewCount,
      this.answerCount,
      this.score,
      this.lastActivityDate,
      this.creationDate,
      this.lastEditDate,
      this.questionId,
      this.contentLicense,
      this.link,
      this.title});

  Question.fromJson(Map<String, dynamic> json) {
    tags = json['tags'].cast<String>();
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    isAnswered = json['is_answered'];
    viewCount = json['view_count'];
    answerCount = json['answer_count'];
    score = json['score'];
    lastActivityDate = json['last_activity_date'];
    creationDate = json['creation_date'];
    lastEditDate = json['last_edit_date'];
    questionId = json['question_id'];
    contentLicense = json['content_license'];
    link = json['link'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tags'] = this.tags;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['is_answered'] = this.isAnswered;
    data['view_count'] = this.viewCount;
    data['answer_count'] = this.answerCount;
    data['score'] = this.score;
    data['last_activity_date'] = this.lastActivityDate;
    data['creation_date'] = this.creationDate;
    data['last_edit_date'] = this.lastEditDate;
    data['question_id'] = this.questionId;
    data['content_license'] = this.contentLicense;
    data['link'] = this.link;
    data['title'] = this.title;
    return data;
  }
}

class Owner {
  int? accountId;
  int? reputation;
  int? userId;
  String? userType;
  String? profileImage;
  String? displayName;
  String? link;

  Owner(
      {this.accountId,
      this.reputation,
      this.userId,
      this.userType,
      this.profileImage,
      this.displayName,
      this.link});

  Owner.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    reputation = json['reputation'];
    userId = json['user_id'];
    userType = json['user_type'];
    profileImage = json['profile_image'];
    displayName = json['display_name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['reputation'] = this.reputation;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['profile_image'] = this.profileImage;
    data['display_name'] = this.displayName;
    data['link'] = this.link;
    return data;
  }
}
