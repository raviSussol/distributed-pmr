pragma solidity >=0.4.21 <0.6.0;

contract MedicalRecord {
  address public contractOwner;
  address[] public candidateList;
  uint public medicalProblemCount = 0;
  uint public allergyCount = 0;
  uint public medicationCount = 0;

  // Store roles of each candidate to their corresponding addresses
  mapping(address => Roles) public candidateRoles;

  // Store accesses that is/are controlled by roles of each candidate to their corresponding addresses
  mapping(address => bool) public candidateCanAccess;

  enum Roles { DOCTOR, PATIENT }

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

  constructor() {
    contractOwner = msg.sender; // Set the contract owner address
  }

  modifier OwnerOnly {
    if(msg.sender == contractOwner) {
      _;
    }
  }

  // All candidates have to go through this registration process
  // And only contract owner can register the candidate
  function registerCandidate(address _candidate, _candidateRoles, _candidateCanAccess) OwnerOnly public {
    candidateList.push(_candidate);
    candidateRoles[_candidate] = _candidateRoles; // Set role for this candidate
    candidateCanAccess[_candidate] = _candidateCanAccess; // Set role for this candidate
  }

  // Check if this candidate is registered or not before allowing resources access.
  function validateCandidate(address _candidate) view public returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if(candidateList[i] == _candidate) {
        return true;
      }
    }
    return false;
  }

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

    // Require a valid doctor to create medication
    require(condition);
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

  function transferMedicationTo() public
}
