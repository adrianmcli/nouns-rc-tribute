// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract NounsDAOTributeLedger {
    // Structure for storing a tribute
    struct Tribute {
        address author;
        string message;
        uint256 timestamp;
        uint256 eventId; // New field added
    }

    // Array to store tributes
    Tribute[] public tributes;

    // Event to emit when a new tribute is added
    event NewTribute(address indexed author, string message, uint256 timestamp, uint256 eventId);

    // Function to add a tribute
    function addTribute(string memory _message, uint256 _eventId) public {
        // Create a new tribute
        Tribute memory newTribute = Tribute(
            msg.sender,
            _message,
            block.timestamp,
            _eventId // Include eventId here
        );

        // Add the tribute to the array
        tributes.push(newTribute);

        // Emit an event
        emit NewTribute(msg.sender, _message, block.timestamp, _eventId);
    }

    // Function to get the count of tributes
    function getTributeCount() public view returns (uint256) {
        return tributes.length;
    }

    // Function to get a specific tribute by index
    function getTribute(uint256 index) public view returns (Tribute memory) {
        require(index < tributes.length, "Index out of bounds");
        return tributes[index];
    }
}
