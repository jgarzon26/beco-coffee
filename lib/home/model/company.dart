import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.g.dart';
part 'company.freezed.dart';

@freezed
class Company with _$Company {
  const factory Company({
    required String company_id,
    required String company_name,
  }) = _CompanyState;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
