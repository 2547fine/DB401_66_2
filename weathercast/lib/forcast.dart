import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjFkMjIxNDc3Yjk4YmUxOTUwNWE3Y2VmOWUwZWVhNWUzMThiZmI0OTIyNjc4ODJkNWMxZTU1YTY5YTE5MTNhNzU2MjI5ZWJjYTE2YzMxZGY3In0.eyJhdWQiOiIyIiwianRpIjoiMWQyMjE0NzdiOThiZTE5NTA1YTdjZWY5ZTBlZWE1ZTMxOGJmYjQ5MjI2Nzg4MmQ1YzFlNTVhNjlhMTkxM2E3NTYyMjllYmNhMTZjMzFkZjciLCJpYXQiOjE3MDc4ODIyNDUsIm5iZiI6MTcwNzg4MjI0NSwiZXhwIjoxNzM5NTA0NjQ1LCJzdWIiOiIzMDE0Iiwic2NvcGVzIjpbXX0.IwYp4v0BCOvj0A4GCLKPnt8ccvAObuD1WJ4w16iJnp5qTpwfDbmoGSFh1dtnnog2zAEk7WFyhfjVqOcz5X9gDTc8TfSytq4z28y_6Ma8geXif_e2qJVkYZ3OzGYf7g3DkSXYHKIgY4O0lzmnjRrpj8_q3TXG16-jKoJWQtmhBaLDFqYxYEtQOw1s6u3tuR8RGyD8bfa55wmK9MCMUA0tXZFzZJByhadTXVLZsLTLheXRC0qe2NMI_GtrgMBy7iUcaFNDGDML5f4Z3sUT1-Cj_ms2E-DlU8thOgyv3NzCYSJyF3wOm7aYAoY9dVpo1sz8qb0luwn9pPhlxU71_a962rcH8oY8JNLtRnGwSLFBqbpgA6sphPBTCA5yfjeQ-KkvzMgcxvlcwsmoD6KRjxJynskF7Ruy8oSGEDLYhN1ZbN9JtCYB9ogyjvVCG-xW9GTMlh-hK9uOaFrNDyYPq8_CQcpTt3IJHywYp9_XV86y07ogNmyoxdkaBMIB19hwr4F7bdRN9hFFUsS6mL2Qm2jPeBZiiyB6iKNETzCL3pMYAWsd5oD9HP2DqBVIFOcBiaBKA7F8ZB5vp3ZZ_Kw5Q_Qk2ZLZ11T-Rd4RNOLPSL5bYuMtJCU4S5XLk5kFsVbrH2Cg4E_xPJpFOYHojii7dLjYL6QpArY2km8DbawrOV_6BuI';

  try {
    Position location = await getCurrentLocation();
    http.Response response = await http.get(
        Uri.parse(
            '$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token',
        });
    return Weather(address: response.body, temperature: 0, cond: 0);
  } catch (e) {
    return Future.error(e);
  }
}
