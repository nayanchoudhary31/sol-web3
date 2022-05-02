//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract Keccak {
    function hashFunction(
        string memory _text1,
        string memory _text2,
        uint256 _num
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text1, _text2, _num));
    }

    //nayanchoudhary 0e2509561c59013411514724d3e686db49d501bf9835f554e545c3cc470406a5

    // Difference Between abi.encode & abi.encodePacked
    // 1. encode => encode data in bytes
    // 2. encodePacked => encode data into bytes and als compress it

    function encodeData(string memory _text1, string memory _text2)
        external
        pure
        returns (bytes memory)
    {
        return abi.encode(_text1, _text2);
    }

    function encodePackedData(string memory _text1, string memory _text2)
        external
        pure
        returns (bytes memory)
    {
        return abi.encodePacked(_text1, _text2);
    }

    // Different Input But Same Output
    // Collision Happen When 2 Dynamic Data is Passed Next to Each Other
    // "AAAA" "BBB" = > H1  "AAA" "ABBB" = > H1
    function collison(string memory _text1, string memory _text2)
        external
        pure
        returns (bytes memory)
    {
        return abi.encodePacked(_text1, _text2);
    }
}
