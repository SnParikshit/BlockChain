pragma solidity ^0.4.19;


contract Election{
	
	//mode a candidate
	struct Candidate {
		uint id;
		string name;
		uint voteCount;
		
	}
	
	//store accounts that has voted
	//boolean value is by default false
	mapping (address => bool) public voters;
	// store candidates
	// fetch candidate
	mapping (uint => Candidate) public candidates;
	
	//store candidates count
	uint public candidatesCount;

	function Election () public{
		addCandidate("Tushar");
		addCandidate("Sriram");
	}

	function addCandidate (string _name) private {
		candidatesCount++;
		candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
		
	}

	function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;
    }
}