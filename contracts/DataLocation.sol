//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

// When used Dynamic Variable we have to define data location
// Data Location Storage, Memory, Calldata
// Storage state variable (Blockchain)
// Memory Data is Loaded on to the memory
// Call Data similar to memory but used in function parameter more gas efficient
contract DataLocation {
    struct MyStruct {
        uint256 foo;
        string text;
    }

    mapping(address => MyStruct) public mystruct;

    function example(uint256[] calldata y, string memory str)
        external
        returns (address[] memory, string memory)
    {
        mystruct[msg.sender] = MyStruct({text: "Hello", foo: 123});

        MyStruct storage mySt = mystruct[msg.sender]; // Use storage to update data

        mySt.text = "Jod";
        mySt.foo = 456;
        y;

        MyStruct memory readOnly = mystruct[msg.sender]; // Use memory to read data

        readOnly.text = "Han Bhai";
        readOnly.foo = 789;

        // Array with memory are always fixed in size
        address[] memory arr = new address[](3);

        arr[0] = address(this);
        arr[1] = address(1);
        arr[2] = address(2);

        internaFunc(y);

        return (arr, str);
    }

    function internaFunc(uint256[] calldata _x) internal pure {
        uint256 y = _x[0];
        y;
    }
}
