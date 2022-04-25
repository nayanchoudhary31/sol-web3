//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract CallAnotherContract {
    function setXContract(TestContract _testContractAddress, uint256 _x)
        external
    {
        _testContractAddress.setX(_x);
    }

    function getXContract(TestContract _testContractAddress)
        external
        view
        returns (uint256)
    {
        return _testContractAddress.getX();
    }

    function setEthAndSetValue(TestContract _testContracAddress, uint256 _x)
        external
        payable
    {
        _testContracAddress.sendEthAndSetValue{value: msg.value}(_x);
    }

    function getXAndValue(TestContract _testContractAddress)
        external
        view
        returns (uint256, uint256)
    {
        (uint256 x, uint256 value) = _testContractAddress.getXAndValue();
        return (x, value);
    }
}

contract TestContract {
    uint256 public x = 123;
    uint256 public value;

    function setX(uint256 _x) external {
        x = _x;
    }

    function getX() external view returns (uint256) {
        return x;
    }

    function sendEthAndSetValue(uint256 _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXAndValue() external view returns (uint256, uint256) {
        return (x, value);
    }
}
