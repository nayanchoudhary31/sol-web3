//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract IterableMapping {
    mapping(address => uint256) public balances;
    mapping(address => bool) public isKeyExist; //  Mapping to store key exist or not
    address[] public allKeys; // array of all key

    function setMap(address _key, uint256 _val) external {
        balances[_key] = _val;

        if (!isKeyExist[_key]) {
            isKeyExist[_key] = true;
            allKeys.push(_key);
        }
    }

    function getSize() external view returns (uint256) {
        return allKeys.length;
    }

    function firstKey() external view returns (uint256) {
        return balances[allKeys[0]];
    }

    function lastkey() external view returns (uint256) {
        return balances[allKeys[allKeys.length - 1]];
    }

    function getKey(uint256 _i) external view returns (uint256) {
        return balances[allKeys[_i]];
    }
}
