//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Anyone can Deposit ETH
// Only Owner can withdraw and destroy the piggybank

contract PiggyBank {
    address payable public owner;

    event Deposit(address indexed account, uint256 indexed amount);

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    } // Msg.data will be empty

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() external {
        require(msg.sender == owner, "Only Owner");
        selfdestruct(owner); // Send Total ETH to Owner and Destroy Contract
    }
}
