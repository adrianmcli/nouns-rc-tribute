// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NounsDAOTributeLedger.sol"; // Adjust the path as per your directory structure

contract NounsDAOTributeLedgerTest is Test {
    NounsDAOTributeLedger ledger;

    function setUp() public {
        ledger = new NounsDAOTributeLedger();
    }

    function testAddTribute() public {
        string memory testMessage = "Nouns DAO is awesome!";
        ledger.addTribute(testMessage);

        NounsDAOTributeLedger.Tribute memory retrievedTribute = ledger
            .getTribute(0);

        assertEq(retrievedTribute.author, address(this));
        assertEq(retrievedTribute.message, testMessage);
        assertTrue(retrievedTribute.timestamp > 0);
    }

    function testGetTributeCount() public {
        assertEq(ledger.getTributeCount(), 0);
        ledger.addTribute("First Tribute");
        assertEq(ledger.getTributeCount(), 1);
        ledger.addTribute("Second Tribute");
        assertEq(ledger.getTributeCount(), 2);
    }

    function testFailGetTributeOutOfBounds() public view {
        ledger.getTribute(0); // Should fail as there is no tribute yet
    }
}
