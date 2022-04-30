//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract CallTest {
    string public message;
    uint256 public number;

    event Log(string message);

    fallback() external payable {
        emit Log("Fallback is Called");
    }

    function foo(string memory _message, uint256 _number)
        external
        payable
        returns (bool, uint256)
    {
        message = _message;
        number = _number;
        return (true, 900);
    }

    receive() external payable {}
}

contract Call {
    bytes public data;

    // Calling _TestContract.call{We Send Value Here}(abi.encodeWithSignature("FunctionName(args1 type, args2 type)",args1,args2));
    // Call will return bool & bytes data
    function callFoo(address _testContract) external payable {
        (bool success, bytes memory _data) = _testContract.call{value: 111}(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );
        require(success, "tx failed");
        data = _data;
    }

    // As this function not exsit fallback is called
    function thatDoesNotExist(address _testContract) external payable {
        (bool success, ) = _testContract.call{value: 11}(
            abi.encodeWithSignature(
                "functionNotExist(uint256,uint256)",
                123,
                134
            )
        );
        require(success, "call failed");
    }
}
