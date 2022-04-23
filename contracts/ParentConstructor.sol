//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Two Ways to Initialize Parent Constructor
// 1. Outside and Close to The Contract When we know the Arguments
// 2. Inside Contract & Rught To The Constructor When We Want Dynamic Intialization

contract A {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

contract B {
    uint256 public num;

    constructor(uint256 _num) {
        num = _num;
    }
}

// First Way
contract C is A("A"), B(256) {

}

// Second Way
contract V is A, B {
    constructor(string memory _text, uint256 _num) A(_text) B(_num) {}
}

// Mixed Way
// OFE
// A => B => Z

contract Z is A("JOD"), B {
    constructor(uint256 _num) B(_num) {}
}

// OFE
// B=> A => K
contract K is B, A {
    constructor(string memory _text, uint256 _num) A(_text) B(_num) {}
}

// The Order of excecution of contract does not depend on the way we call
// But it depends on the way we inherit it
