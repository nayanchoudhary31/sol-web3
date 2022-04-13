//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract IfElse {
    function example(uint256 x) external pure returns (uint256) {
        if (x < 10) {
            return 1;
        } else if (x < 20) {
            return 2;
        } else {
            return 3;
        }
    }


    function ternary(uint256 y) external pure returns(uint256){
        return y < 10 ? 1:2;
    }
}
