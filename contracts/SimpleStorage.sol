//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract SimpleStorage {
    string public text;

    // Call Data Cost => 51204 for string "hello"
    // Memory Cost => 51759 for string "hello";

    function setText(string memory _text) external {
        text = _text;
    }

    function getText() external view returns (string memory) {
        return text;
    }
}
