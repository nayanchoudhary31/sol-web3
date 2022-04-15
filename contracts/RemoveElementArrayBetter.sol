//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract RemoveElementArrayBetter {
    // We take the element index and replace it with last element and pop the last element
    // In this way we dont shift each element but we dont preserved the order here

    uint256[] public arr;

    //[1,2,3,4,5,6] remove(3) => [1,2,3,6,5,6] => [1,2,3,6,5];

    function remove(uint256 _index) public {
        require(_index < arr.length, "Out of Bound");
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }

    function test() public {
        arr = [1, 2, 3, 4, 5, 6];
        remove(3);

        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 3);
        assert(arr[3] == 6);
        assert(arr[4] == 5);
    }
}
