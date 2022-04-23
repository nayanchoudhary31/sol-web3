//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract A {
    event Log(string message);

    function foo() public virtual returns (string memory) {
        emit Log("A.foo");
        return "FOO";
    }

    function doo() public virtual returns (string memory) {
        emit Log("A.doo");
        return "DOO";
    }
}

contract B is A {
    function foo() public virtual override returns (string memory) {
        emit Log("B.foo");
        return A.foo(); // Direct
    }

    function doo() public virtual override returns (string memory) {
        emit Log("B.doo");
        return super.doo(); // Using Super
    }
}

contract C is A {
    function foo() public virtual override returns (string memory) {
        emit Log("C.foo");
        return A.foo(); // Direct
    }

    function doo() public virtual override returns (string memory) {
        emit Log("C.doo");
        return super.doo(); // Using Super
    }
}

contract D is B, C {
    function foo() public override(B, C) returns (string memory) {
        emit Log("D.foo");
        return A.foo(); // Direct
    }

    function doo() public override(B, C) returns (string memory) {
        emit Log("D.doo");
        return super.doo(); // Using Super
    }
}
