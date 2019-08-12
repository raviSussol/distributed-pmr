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

  function createAllergy(
    string memory _title,
    string memory _medicationType,
    string memory _medicalCode,
    string memory _beginDate,
    string memory _endDate,
    string memory _occurance,
    string memory _referredBy,
    string memory _outcome,
    string memory _comments) public {
    medications[msg.sender] = Medication(
      _id,
      _title,
      _medicationType,
      _medicalCode,
      _beginDate,
      _endDate,
      _occurance,
      _referredBy,
      _outcome,
      _comments
    );
  }

  function createMedication(
    string memory _title,
    string memory _medicationType,
    string memory _medicalCode,
    string memory _beginDate,
    string memory _endDate,
    string memory _occurance,
    string memory _referredBy,
    string memory _outcome,
    string memory _comments) public {
    medications[msg.sender] = Medication(
      _id,
      _title,
      _medicationType,
      _medicalCode,
      _beginDate,
      _endDate,
      _occurance,
      _referredBy,
      _outcome,
      _comments
    );
  }
}
