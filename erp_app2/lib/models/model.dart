// class Welcome {
//     String? subject;
//     int? totalPresent;
//     int? totalAbsent;
//     double? overallPercentage;

//     Welcome({
//         this.subject,
//         this.totalPresent,
//         this.totalAbsent,
//         this.overallPercentage,
//     });

//   static WelcomefromJson(Map<String, dynamic> index) {}

//   static Welcome fromJson(Map<String, dynamic> index) {}

// }


class Welcome {
  String? subject;
  int? totalPresent;
  int? totalAbsent;
  double? overallPercentage;

  Welcome({
    this.subject,
    this.totalPresent,
    this.totalAbsent,
    this.overallPercentage,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) {
    return Welcome(
      subject: json['subject'] as String?,
      totalPresent: json['totalPresent'] as int?,
      totalAbsent: json['totalAbsent'] as int?,
      overallPercentage: json['overallPercentage'] as double?,
    );
  }
}

void main() {
  // Example JSON data
  Map<String, dynamic> jsonData = {
    'subject': 'Math',
    'totalPresent': 20,
    'totalAbsent': 5,
    'overallPercentage': 80.0,
  };

  // Creating a Welcome object from JSON data
  Welcome welcomeObject = Welcome.fromJson(jsonData);

  // Accessing properties of the Welcome object
  print('Subject: ${welcomeObject.subject}');
  print('Total Present: ${welcomeObject.totalPresent}');
  print('Total Absent: ${welcomeObject.totalAbsent}');
  print('Overall Percentage: ${welcomeObject.overallPercentage}');
}
