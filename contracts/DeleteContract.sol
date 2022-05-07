//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Can Delete Contract With
// selfdestruct() and force ether to any address

contract Kill {
    constructor() payable {}

    // Will Delete the Contract & Force Send Ether even receiver contract dont have fallback functions
    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    function demoTest() external pure returns (uint256) {
        return 123;
    }
}

contract Demo {
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function killContract(Kill _kill) external {
        _kill.kill();
    }
}
