//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Visibility
// Private => Inside Contract Only Not Child Contract
// Internal => Inside Contract & Child Contract Only
// Public => Inside & Outside Contract
// External => Only Outside Contract

contract VisibilityBase {
    uint256 private x = 123;
    uint256 internal y = 234;
    uint256 public z = 789;

    function privateFuncion() private pure returns (uint256) {
        return 200;
    }

    function internalFunction() internal pure returns (uint256) {
        return 100;
    }

    function publicFunction() public pure returns (uint256) {
        return 300;
    }

    function externalFunction() external pure returns (uint256) {
        return 69;
    }

    function example() external view {
        x + y + z; // We can use internal , private & public state variables

        privateFuncion();
        internalFunction();
        publicFunction();

        // externalFunction(); // Cant Call External Contract
        this.externalFunction(); // Can use this to call external Function inside contract but not recommended
    }
}

contract VisibilityDerived is VisibilityBase {
    function demo() external view {
        y + z; // Can access public & internal state variable

        internalFunction();
        publicFunction();
    }
}
