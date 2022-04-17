//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Mapping Key:Value Python Dictionary
// Declare & create  mapping (simple & nested)
// Set Get Delete
contract Mapping {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => bool)) isFriend;

    function example() external {
        balances[msg.sender] = 123; // Set
        uint256 bal = balances[msg.sender]; // Get
        bal;
        uint256 bal1 = balances[address(1)]; // 0
        bal1;

        delete balances[msg.sender]; // 0 Reset to Default Values

        isFriend[msg.sender][address(this)] = true;
    }
}
