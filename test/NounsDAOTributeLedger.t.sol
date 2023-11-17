// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NounsDAOTributeLedger.sol"; // Adjust the import path as necessary

contract NounsDAOTributeLedgerTest is Test {
    NounsDAOTributeLedger ledger;

    function setUp() public {
        ledger = new NounsDAOTributeLedger();
    }

    function testAddTribute() public {
        string memory testMessage = "Thank you for your contribution!";
        address testEventId = address(123);  // Example POAP address
        ledger.addTribute(testMessage, testEventId);

        assertEq(ledger.getTributeCount(), 1, "Tribute count should be 1 after adding a tribute");

        NounsDAOTributeLedger.Tribute memory tribute = ledger.getTribute(0);
        assertEq(tribute.author, address(this), "Author of tribute should be the test contract");
        assertEq(tribute.message, testMessage, "Tribute message should match the input");
        assertEq(tribute.eventId, testEventId, "Tribute eventId should match the input");
    }

    function testGetTributeOutOfBounds() public {
        vm.expectRevert("Index out of bounds");
        ledger.getTribute(0); // Expecting revert as no tribute has been added yet
    }
}
