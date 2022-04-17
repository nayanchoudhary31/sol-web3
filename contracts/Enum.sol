//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Enum allow to have multiple choice in boolean we have only 2
contract Enum {
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    Status public status; // Enum can be State Variable
    struct Order {
        // Enum can be used in struct also
        address buyer;
        uint256 price;
        Status status;
    }

    Order[] public orders;

    // Get Enum Value
    function getStatus() external view returns (Status) {
        return status;
    }

    // Set Stauts of Enum
    function setStatus(Status _status) external {
        status = _status;
    }

    // Change Status to Shipped
    function shipStatus() external {
        status = Status.Shipped;
    }

    // Reset the Enum to Default Value
    function resetStatus() external {
        delete status;
    }
    // Enum Reference 
    // https://jeancvllr.medium.com/solidity-tutorial-all-about-enums-684adcc0b38e
}
