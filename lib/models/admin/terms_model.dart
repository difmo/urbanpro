class TermsModel {
  String terms;

  TermsModel({
    required this.terms,
  });

  factory TermsModel.fromJson(Map<String, dynamic> json) {
    return TermsModel(
      terms: json['terms'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'terms': terms,
    };
  }
}
