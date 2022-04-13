//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract DataTypes {
    // Data Type => value & references

    bool public b = true;
    uint256 public u = 123; // uint => uint256 => 0 to 2**256-1
    // uint8  0 to 2**8-1
    // uint16 0 to 2**16 -1

    int256 public i = -123; // int  int256 =>  -2**255 to 2**255-1

    // Find Min & Max Value of Datatype

    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    uint256 public minUint = type(uint256).min;
    uint256 public maxUint = type(uint256).max;

    address public addr = 0x087733720396b9637578a9dB2D8b30Ab2614AB2f;

    bytes32 public b32 =
        0x929cf6e16295b47ef36e382796bc2b3100d445ee6a4ff104307f59a8e2a00640;
}
