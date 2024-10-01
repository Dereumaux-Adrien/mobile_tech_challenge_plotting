import 'package:http/http.dart' as http;

import 'package:mobile_tech_challenge_plotting/models/glucose_samples.dart';

/// Our services class that allows us to get access to the database
/// (a simple json file in our case)
class DatabaseAccess {
  Future<GlucoseSamples> getGlucoseSamplesList() async {
    final response = await http
        .get(
      Uri.parse(
        'https://s3-de-central.profitbricks.com/una-health-frontend-tech-challenge/sample.json',
      ),
    )
        .catchError((error) {
      return http.Response("{}", 444);
    });

    if (response.statusCode != 200) {
      return GlucoseSamples();
    }

    return GlucoseSamples.fromJson(response.body);
  }
}
