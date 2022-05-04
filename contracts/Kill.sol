//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// We can delete the contract from blockchain
// using the selfdestruct method
// and send all the contract balance to an address

contract Kill {
    constructor() payable {}

    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    function testNum() external pure returns (uint256) {
        return 123;
    }
}

contract Test {
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function KillTransferETH(Kill _kill) external {
        _kill.kill();
    }
}
