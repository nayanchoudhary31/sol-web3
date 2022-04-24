//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdrawEther(uint256 _amount) external {
        require(msg.sender == owner, "Only Owner");
        (bool success, ) = msg.sender.call{value: _amount}("");
        require(success, "Call Failed");
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
