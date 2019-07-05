pragma solidity ^0.5.0;

contract Election {

  struct Candidate{
    uint id;
    string name;
    uint voteCount;
  }
  //store accounts that have voted // default value will be false
  mapping(address => bool) public voters;
  //store and fetch candidates
  mapping(uint => Candidate) public candidates;
  uint public candidatesCount;

  constructor() public{
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  event votedEvent(uint indexed _candidateId);

  function addCandidate(string memory _name) private{
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
  }

  function vote(uint _candidateId) public{
      //check if voted before
      require(!voters[msg.sender],"Has Voted before");
      require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid Candidate Code");
      //record voter as voted
      voters[msg.sender] = true;
      //update vote count
      candidates[_candidateId].voteCount++;
  }

}
