//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Library are used to enhance datatypes
// Can be used to seperate the code & reuse the code
// Library can not have state variables
//  Can use library using keyword

library Math {
    function findMax(uint256 x, uint256 y) internal pure returns (uint256) {
        return x >= y ? x : y;
    }

    function find(uint256[] memory arr, uint256 x)
        internal
        pure
        returns (uint256)
    {
        for (uint256 j = 0; j < arr.length; j++) {
            if (arr[j] == x) return j;
        }
        revert("Not Found");
    }
}

contract TestLibrary {
    function testMax(uint256 num1, uint256 num2)
        external
        pure
        returns (uint256)
    {
        return Math.findMax(num1, num2);
    }
}

contract TestArrayLibrary {
    using Math for uint256[];
    uint256[] public arr = [3, 2, 1];

    function testFindIndex() external view returns (uint256) {
        return arr.find(2);
    }
}
