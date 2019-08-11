pragma solidity >=0.4.21 <0.6.0;

contract MedicalRecord {
  struct MedicalProblem {
    uint id;
    string title;
    string problemType;
    string medicalCode;
    string beginDate;
    string endDate;
    string occurance;
    string referredBy;
    string outcome;
    string comments;
  }

  mapping(address => MedicalProblem) public medicalProblems;

  struct Allergy {
    uint id;
    string title;
    string allergyType;
    string medicalCode;
    string beginDate;
    string endDate;
    string occurance;
    string severity;
    string reaction;
    string referredBy;
    string outcome;
    string comments;
  }

  mapping(address => Allergy) public allergies;

  struct Medication {
    uint id;
    string title;
    string medicationType;
    string medicalCode;
    string beginDate;
    string endDate;
    string occurance;
    string referredBy;
    string outcome;
    string comments;
  }

  mapping(address => Medication) public medications;
}
