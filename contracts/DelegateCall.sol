//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract Main {
    // State Variable Should be Same Sequence Also if not you will get weird result
    uint256 public value;
    bool public isDeployed;
    address public sender;

    function setValues(address _contractAddress, bool _val) external payable {
        //1. First way to Delegate Call to Main Contract
        // (bool success,) = _contractAddress.delegatecall(abi.encodeWithSignature("setValues(bool)",_val));
        // 2. Second way to Delegate Call to Main Contract gas
        (bool success, bytes memory data) = _contractAddress.delegatecall(
            abi.encodeWithSelector(DeployV1.setValues.selector, _val)
        );

        data;

        require(success, "tx failed");
    }
}

contract DeployV1 {
    uint256 public value;
    bool public isDeployed;
    address public sender;

    function setValues(bool _isDeployed) external payable {
        sender = msg.sender;
        value = msg.value;
        isDeployed = _isDeployed;
    }
}
