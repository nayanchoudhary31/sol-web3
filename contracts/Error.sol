//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// 3 Ways to Throw Erro
// 1. Require  2.Revert  3.Assert
//  Gas Refund , any state update will revert
// From 0.8 we can have the custome error
contract Error {
    function testRequire(uint256 i) public pure {
        require(i <= 10, "I is 10");
    }

    function testRevert(uint256 i) public pure {
        if (i > 1) {
            if (i > 5) {
                if (i > 10) {
                    revert("I > 10"); // Can be useful in nested condition
                }
            }
        }
    }

    uint256 public num = 123;

    function assertFunction() public view {
        assert(num == 123);
    }

    // Custome Error
    error CustomError(address caller, uint256 i);

    function customError(uint256 i) public view {
        if (i < 10) {
            revert CustomError(msg.sender, i); // Custom Error
        }
    }
}
