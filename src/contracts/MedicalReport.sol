pragma solidity >=0.4.21 <0.6.0;

contract MedicalReport{

  enum Roles{
    DOCTOR,
    PATIENT
  }

  mapping(address => Roles) public roles;

  mapping(address => uint) public access;



  struct Medicine{

    string name;

    string dosageDescription;

  }



  struct Prescription{

    string hospitalName;

    string diseaseName;

    Medicine medicine;

  }



  struct PatientPrescription{

    uint prescriptionCount;

    uint addressCount;

    Prescription[] prescription;

    address[] doctor;

  }



  mapping(address => PatientPrescription) public prescriptions;



  function register(Roles _role) public{

    roles[msg.sender]=_role;

  }



  function accessToDoctor(address _doctorAddress) public{

    require(roles[msg.sender]==Roles.PATIENT,"You need to be a patient to give access");

    prescriptions[msg.sender].addressCount++;

    prescriptions[msg.sender].doctor[prescriptions[msg.sender].addressCount] = _doctorAddress;

  }



  function prescribePatient(address _patientAddress, Prescription memory _prescription) public{

    require(roles[msg.sender]==Roles.DOCTOR,'You need to be doctor to prescribe patient');

    for(uint i=1; i<= prescriptions[_patientAddress].addressCount; i++){

      if(prescriptions[_patientAddress].doctor[i]==msg.sender){

        access[msg.sender]=1;

      }

    }

    require(access[msg.sender]==1,"You need to get access first by the patient");

    prescriptions[_patientAddress].prescriptionCount++;

    prescriptions[_patientAddress].prescription[prescriptions[msg.sender].prescriptionCount]=_prescription;

    access[msg.sender]=0;

  }

}
