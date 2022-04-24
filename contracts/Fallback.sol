//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Fallback execute
// When function is not exist
// Generally used to Send Ether Directly To Contract

// Two Function
// fallback() external payable{} // If msg.data is not empty fallback is called
// receive() external payable{} // If msg.data is empty && receive function exist then receive is called else fallback is called

contract Fallback {
    event Log(string func, address sender, uint256 val, bytes data);

    fallback() external payable {
        emit Log("Fallback", msg.sender, msg.value, msg.data);
    }

    // receive() external payable {
    //     emit Log("Receive", msg.sender, msg.value, "");
    // }
}
