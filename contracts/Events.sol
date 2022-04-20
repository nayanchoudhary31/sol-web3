//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Index allow us to filter logs quickly
// Upto 3 Indexed are supported
contract Events {
    event Log(string message, uint256 val);
    event LogIndex(address indexed sender, uint256 val);

    function example() external {
        emit Log("foo", 1234);

        emit LogIndex(msg.sender, 789);
    }

    event SendText(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata _message) external {
        emit SendText(msg.sender, _to, _message);
    }
}
