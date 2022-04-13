//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract Counter {
    uint256 public value;

    function increment() external {
        value += 1;
    }

    function decrement() external {
        value -= 1;
    }
}
