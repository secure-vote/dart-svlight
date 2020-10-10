import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'types.mapper.g.dart' show initializeJsonMapper;

@jsonSerializable
class BallotSpecV2 {
  static const int ballotVersion = 2;
  final BallotInner ballotInner;
  final int optionsVersion;
  @JsonProperty(ignoreIfNull: true)
  final OptionsInner optionsInner;

  const BallotSpecV2(this.ballotInner, this.optionsVersion, this.optionsInner);
}

abstract class OptionsInner<O, A> {
  final A aux;
  final O options;

  const OptionsInner(this.options, this.aux);

  int getOptionsVersion();
}

@jsonSerializable
class OptionsYesNo implements OptionsInner<Null, Null> {
  @override
  get aux => null;

  @override
  get options => null;

  @override
  int getOptionsVersion() {
    return 2;
  }
}

@jsonSerializable
class OptionsRange implements OptionsInner<List<RangeOpt>, Null> {
  final Null aux = null;
  @JsonProperty(ignore: true)
  final int optionsVersion = 1;
  final List<RangeOpt> options;

  const OptionsRange(this.options);

  @override
  int getOptionsVersion() {
    return optionsVersion;
  }
}

@jsonSerializable
class BallotInner {
  final String ballotTitle;
  final String shortDesc;
  final String longDesc;
  @JsonProperty(ignoreIfNull: true)
  final String discussionLink;
  @JsonProperty(ignoreIfNull: true)
  final String encryptionPK;

  const BallotInner(this.ballotTitle, this.shortDesc, this.longDesc,
      this.discussionLink, this.encryptionPK);
}

@jsonSerializable
class RangeOpt {
  final String optionTitle;
  final String optionDesc;

  RangeOpt(this.optionTitle, this.optionDesc);
}
