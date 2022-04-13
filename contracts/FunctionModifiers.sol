//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Function Modifiers use to reuse the  code

// Basic , Input , Sandwich
contract FunctionModifiers {
    uint256 public count;
    bool public paused;

    modifier shouldPaused() {
        require(!paused, "Paused");
        _;
    }

    function setPaused(bool _paused) external {
        paused = _paused;
    }

    function incre() external shouldPaused {
        // require(!paused,"Paused");
        count += 1;
    }

    function decre() external shouldPaused {
        // require(!paused,"Paused");
        count -= 1;
    }

    // Input Modifier

    modifier numIncre(uint256 num) {
        require(num < 100, "less than 100");
        _;
    }

    function incBy(uint256 _x) external numIncre(_x) {
        // require(_x <100 ,"x less 100");
        count += _x;
    }

    // Sandwich

    modifier sandwich() {
        // code here
        count += 10;
        _;
        count += 20;
    }

    function testDemo() external sandwich {
        count += 1;
    }
}
