//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Intialization
// Insert (Push) , get , update , delete , pop , length
// Create array in memory
// Returning array from function
contract Array {
    uint256[] public nums = [1, 2, 3]; //Dynamic Array
    uint256[3] public numFixed = [7, 8, 9]; // Fixed Array

    function example() external {
        nums.push(4); // [1,2,3,4]
        uint256 x = nums[1]; // 2 access by index
        x;
        nums[2] = 777; // [1,2,777,4];

        delete nums[2]; // delete will set the default value at mention index wont shrink the array
        nums.pop(); // Remove the element from last and decrease the array size

        uint256 len = nums.length; // Give me length of the array
        len;

        // Create Memory Array
        uint256[] memory a = new uint256[](5); // Array in Memory is Fixed Size
        // a.push(); // Push pop is not availabe in Memory Array
        a[2] = 123;
    }

    function getArray() public view returns (uint256[] memory) {
        return nums;
    }
}
