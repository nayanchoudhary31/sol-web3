//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

interface ICounter {
    function getCount() external view returns (uint256);

    function incre() external;

    function decre() external;
}

contract CallInterface {
    uint256 public count;

    function example(address _counter) external {
        ICounter(_counter).incre();
        count = ICounter(_counter).getCount();
    }
}
