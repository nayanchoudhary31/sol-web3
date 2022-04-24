//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// 3 Ways to Transfer Ether
// 1. Transfer gas 2300 , revert // can we used
// 2. Send gas 2300 , bool // not recommended
//  3. call all gas , bool bytes data  // recommended way

contract SendEth {
    constructor() payable {}

    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(123);
        require(sent, "send failed");
    }

    function sendViaCall(address payable _to) external payable {
        (
            bool success, /*bytes memory data */

        ) = _to.call{value: 123}("");
        require(success, "Call Failed");
    }
}

contract ReceiveEther {
    event Log(uint256 amount, uint256 gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}
