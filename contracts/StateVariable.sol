//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract StateVariable{
    //  Local Variable & State Variable & Global Variable

    uint public i = 123; // State Variable 
    bool public b = false;

    // msg.sender , msg.value , block.number , block.timestamp all are global variable

    function add(uint256 x,uint256 y) public pure returns(uint){
        uint c = x+y; // Local Variable
        return c;
    }
}