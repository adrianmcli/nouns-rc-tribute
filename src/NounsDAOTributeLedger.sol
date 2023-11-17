// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract NounsDAOTributeLedger {
    struct Tribute {
        address author;
        string message;
        uint256 timestamp;
        address eventId; // Changed to address type
    }

    Tribute[] public tributes;

    event NewTribute(
        address indexed author,
        string message,
        uint256 timestamp,
        address eventId
    );

    function addTribute(string memory _message, address _eventId) public {
        Tribute memory newTribute = Tribute(
            msg.sender,
            _message,
            block.timestamp,
            _eventId
        );

        tributes.push(newTribute);

        emit NewTribute(msg.sender, _message, block.timestamp, _eventId);
    }

    function getTributeCount() public view returns (uint256) {
        return tributes.length;
    }

    function getTribute(uint256 index) public view returns (Tribute memory) {
        require(index < tributes.length, "Index out of bounds");
        return tributes[index];
    }
}
