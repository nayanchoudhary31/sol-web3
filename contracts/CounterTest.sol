//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract CounterTest {
    uint256 public count;

    function getCount() external view returns (uint256) {
        return count;
    }

    function incre() external {
        count += 1;
    }

    function decre() external {
        count -= 1;
    }
}
