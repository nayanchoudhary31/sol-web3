//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract Constant {
    address public constant myAddress =
        0x087733720396b9637578a9dB2D8b30Ab2614AB2f; // Gas 21420
    uint256 public constant myConstant = 12345;
}

contract WithoutConstant {
    address public myAddress = 0x0000000000000000000000000000000000000000; //Gas 23553
}
