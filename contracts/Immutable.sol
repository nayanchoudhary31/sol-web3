//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Immutable are just like constant\
// Only can initialize when deploying
// It also save gas
contract Immutable {
    address public immutable owner; //123661

    // address public owner; //149410
    constructor() {
        owner = msg.sender;
    }
}
