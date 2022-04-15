//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract RemoveElementArray {
    uint256[] public arr;

    // Shift each elememt to left and pop the last one 
    // This Approach Preserve Order
    function example() public {
        arr = [1,2,3]; // [1,2,3]
        delete arr[1]; // [1,0,3];
    }

    // [1,2,3,4,5] => remove(2) [1,2,4,5,5] => [1,2,4,5];
    //[1,2,3,4,5,6] => remove(3) => [1,2,3,5,6,6] => [1,2,3,5,6]

    function remove(uint256 _index) public {
        require(_index < arr.length, "Out of Bound Error"); // base Case
        for (uint256 j = _index; j < arr.length - 1; j++) {
            arr[j] = arr[j + 1];
        }
        arr.pop();
    }


    function test() external{
        arr=[1,2,3,4,5];
        remove(2);
        assert(arr[0]==1);
        assert(arr[1]==2);
        assert(arr[2]==4);
        assert(arr[3]==5);

    }
}
