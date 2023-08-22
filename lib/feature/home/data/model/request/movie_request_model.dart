class MovieRequestModel {
  String? language;
  int? page;
  String? region;

  MovieRequestModel({this.language = 'en-US', this.page, this.region});

  MovieRequestModel.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    page = json['page'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (language != null) data['language'] = language;
    if (page != null) data['page'] = page;
    if (region != null) data['region'] = region;
    return data;
  }
}
