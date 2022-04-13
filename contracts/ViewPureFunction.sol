//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract ViewPureFunction {
    // View Function can read data from blockchain
    // Pure Function can not read data from blockchain

    uint256 x = 123;

    function viewFunc() external view returns (uint256) {
        return x;
    }

    function pureFunc() external pure returns (uint256) {
        return 1;
    }
}
