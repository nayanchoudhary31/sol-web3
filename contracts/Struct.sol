//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// Struct allow you group data
contract Struct {
    // This is how you declare a struct
    struct Car {
        string car;
        uint256 year;
        address owner;
    }

    // Struct can be a state variable
    Car public car;
    // Struct can be arrays
    Car[] public carArray;
    // Struct can be a mapping also
    mapping(address => Car) public carByOwner;

    function example() external {
        Car memory c1 = Car("Tesla", 1998, msg.sender); // One Way to Initialize Struct order important
        Car memory c2 = Car({car: "Maruti", owner: msg.sender, year: 1990}); // Second Way to Initialize Struct Order not important
        Car memory c3; // Third Way to Initialize Struct
        c3.car = "Jaguar";
        c3.owner = msg.sender;
        c3.year = 1800;

        carArray.push(c1);
        carArray.push(c2);
        carArray.push(c3);
        carArray.push(Car("Ferrari", 1786, msg.sender)); // Initialize & Store in to Car Array

        Car storage _car = carArray[0]; // Will change the state and update the state with state
        _car.car = "Mercedez";
        _car.owner = address(1);
        _car.year = 2021;

        // Delete the Owner of carArray[1]
        delete carArray[1].owner;
    }
}
