import 'dart:convert';

import 'package:svlight/src/ballotspec/types.dart';
import 'package:test/test.dart';

void main() async {
  test('can sz and unsz ballotspec', () async {
    var nowMs = DateTime.now().millisecondsSinceEpoch;
    var bs = BallotSpecV2(
        BallotInner("test-$nowMs", "short: $nowMs", "long: $nowMs",
            discussionLink: "https://forum.voteflux.org"),
        OptionsYesNoInner());
    var bsStr = jsonEncode(bs.toJson());
    var bs2 = BallotSpecV2.fromJson(jsonDecode(bsStr) as Map<String, dynamic>);
    expect(bs.toJson(), bs2.toJson(), reason: "BallotSpecV2.toJson().(==)");
    expect(bs, bs2, reason: "BallotSpecV2.(==)");
  });
}
