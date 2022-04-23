//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Add Virtual to Tell Parent Contract That This Function can be Override

contract A {
    function foo() external pure returns (string memory) {
        return "Foo";
    }

    function bar() external pure virtual returns (string memory) {
        return "Bar";
    }

    function doo() external pure virtual returns (string memory) {
        return "Doo";
    }
}

contract B is A {
    function bar() external pure override returns (string memory) {
        return "Contract B Bar";
    }

    function doo() external pure override returns (string memory) {
        return "Contract B Doo";
    }

    function too() external pure virtual returns (string memory) {
        return "Too Contract B";
    }
}

contract C is B {
    function too() external pure override returns (string memory) {
        return "Too Contract C";
    }
}
