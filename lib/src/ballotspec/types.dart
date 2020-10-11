import 'package:dartz/dartz.dart';
import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';

@JsonSerializable()
class BallotSpecV2 {
  @JsonKey(ignore: false, required: true)
  final int ballotVersion = 2;
  @JsonKey(ignore: false, required: true)
  final int optionsVersion = 2;
  final BallotInner ballotInner;
  final OptionsYesNoInner optionsInner;

  const BallotSpecV2(this.ballotInner, this.optionsInner)
      : assert(ballotInner != null),
        assert(optionsInner != null);

  factory BallotSpecV2.fromJson(Map<String, dynamic> json) {
    var _ballotVersion = json['ballotVersion'] as int;
    var _optionsVersion = json['optionsVersion'] as int;
    assert(_ballotVersion == 2);
    assert(_optionsVersion == 2);
    return BallotSpecV2(
      BallotInner.fromJson(json['ballotInner'] as Map<String, dynamic>),
      OptionsYesNoInner.fromJson(json['optionsInner'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    var m = Map<String, dynamic>();
    m['ballotVersion'] = ballotVersion;
    m['ballotInner'] = ballotInner.toJson();
    m['optionsVersion'] = optionsVersion;
    m['optionsInner'] = optionsInner.toJson();
    return m;
  }

  bool operator ==(Object other) {
    if (other.runtimeType != BallotSpecV2) {
      return false;
    }
    var o = other as BallotSpecV2;
    return o.ballotInner == ballotInner &&
        o.ballotVersion == ballotVersion &&
        o.optionsInner == optionsInner &&
        o.optionsVersion == optionsVersion;
  }

  @override
  String toString() {
    return "BallotSpecV2 <${toJson().toString()}>";
  }
}

// abstract class OptionsInner<O, A> {
//   final A aux;
//   final O options;
//   final int optionsVersion;

//   const OptionsInner(this.options, this.aux);
// }

// @jsonSerializable
// class OptionsYesNo implements OptionsInner<Null, Null> {
//   @override
//   get aux => null;

//   @override
//   get options => null;

//   static int getOptionsVersion() {
//     return 2;
//   }
// }

// @jsonSerializable
// class OptionsRange implements OptionsInner<List<RangeOpt>, Null> {
//   final Null aux = null;
//   @JsonProperty(ignore: true)
//   final int optionsVersion = 1;
//   final List<RangeOpt> options;

//   const OptionsRange(this.options);

//   @override
//   int getOptionsVersion() {
//     return optionsVersion;
//   }
// }

@JsonSerializable()
class BallotInner {
  final String ballotTitle;
  final String shortDesc;
  final String longDesc;
  @JsonKey(nullable: true, includeIfNull: false)
  final String discussionLink;
  @JsonKey(nullable: true, includeIfNull: false)
  final String encryptionPK;

  const BallotInner(this.ballotTitle, this.shortDesc, this.longDesc,
      {this.discussionLink, this.encryptionPK});

  factory BallotInner.fromJson(Map<String, dynamic> json) =>
      _$BallotInnerFromJson(json);
  Map<String, dynamic> toJson() => _$BallotInnerToJson(this);

  bool operator ==(Object other) {
    if (other.runtimeType != BallotInner) {
      return false;
    }
    var o = other as BallotInner;
    return o.ballotTitle == ballotTitle &&
        o.shortDesc == shortDesc &&
        o.longDesc == longDesc &&
        o.discussionLink == discussionLink &&
        o.encryptionPK == encryptionPK;
  }

  @override
  String toString() {
    return "BallotInner <${toJson().toString()}>";
  }
}

@JsonSerializable()
class OptionsYesNoInner {
  final Null options = null;

  OptionsYesNoInner();

  factory OptionsYesNoInner.fromJson(Map<String, dynamic> json) =>
      _$OptionsYesNoInnerFromJson(json);
  Map<String, dynamic> toJson() => <String, dynamic>{"options": options};

  bool operator ==(Object other) {
    if (other.runtimeType != OptionsYesNoInner) {
      return false;
    }
    var o = other as OptionsYesNoInner;
    return o.options == options;
  }

  @override
  String toString() {
    return "OptionsYesNoInner <${toJson().toString()}>";
  }
}

// @JsonSerializable()
// class RangeOpt {
//   final String optionTitle;
//   final String optionDesc;

//   RangeOpt(this.optionTitle, this.optionDesc);
// }

// @union
// class OptionsInner {
//   const factory OptionsInner.yesno() = _$OptionsInner.yesno;
//   const factory OptionsInner.range(List<RangeOpt> options) =
//       _$OptionsInner.range;
// }

// @jsonSerializable
// class OptsYesNo {}

// @jsonSerializable
// class OptsRange {
//   final List<RangeOpt> range;
//   const OptsRange(this.range);
// }

// int optsInnerToVersion(OptionsInner _oi) =>
//     _oi.match(yesno: () => 2, range: (_) => 1);
