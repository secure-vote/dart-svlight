import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BallotSpecV2 {
  static const int ballotVersion = 2;
  final BallotInner ballotInner;
  final int optionsVersion;
  final OptionsInner? optionsInner;

  const BallotSpecV2(this.ballotInner, this.optionsVersion, this.optionsInner);
}

abstract class OptionsInner<O, A> {
  final A aux;
  final O options;
  abstract final int optionsVersion;

  const OptionsInner(this.options, this.aux);
}

class OptionsYesNo implements OptionsInner<Null, Null> {
  @override
  get aux => null;

  @override
  get options => null;

  @override
  int get optionsVersion => 2;
}

class OptionsRange implements OptionsInner<List<RangeOpt>, Null> {
  final Null aux = null;
  final int optionsVersion = 1;
  final List<RangeOpt> options;

  const OptionsRange(this.options);
}

class BallotInner {
  final String ballotTitle;
  final String shortDesc;
  final String longDesc;
  final String? discussionLink;
  final String? encryptionPK;

  const BallotInner(this.ballotTitle, this.shortDesc, this.longDesc,
      this.discussionLink, this.encryptionPK);
}

class RangeOpt {
  final String optionTitle;
  final String? optionDesc;

  RangeOpt(this.optionTitle, this.optionDesc);
}
