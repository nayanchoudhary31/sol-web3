//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Order of Inheritance Most Base(Least Use) to Derived

contract A {
    function foo() external pure virtual returns (string memory) {
        return "Foo";
    }

    function bar() external pure virtual returns (string memory) {
        return "Bar";
    }

    function X() external pure returns (string memory) {
        return "X";
    }
}

contract B {
    function foo() external pure virtual returns (string memory) {
        return "Foo";
    }

    function bar() external pure virtual returns (string memory) {
        return "Bar";
    }

    function Y() external pure returns (string memory) {
        return "Y";
    }
}

contract C is A, B {
    function foo() external pure override(A, B) returns (string memory) {
        return " C Foo";
    }

    function bar() external pure override(A, B) returns (string memory) {
        return "C Bar";
    }
}
