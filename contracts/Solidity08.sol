//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8;

contract Solidity08 {
    /*
    1.Safe Math
    2. Custom Error
    3. Function outside contract
    4. Import {symbol1 as alias , symbol2} from 'filename'
    5. Salted contract creation
*/
}

contract SafeMath {
    function testUnderFlow() public pure returns (uint256) {
        uint256 x = 0;
        x--; // this will give error as from 0.8
        return x;
    }

    function bypassTestUnderFlow() public pure returns (uint256) {
        uint256 x = 0;

        unchecked {
            x--; // wrap around the uncheck will give max number value
        }
        return x;
    }
}

contract VendingMachine {
    address payable owner = payable(msg.sender);

    // Declare a Custom Error
    error NotAuthorized();
    function withdraw() public {
        if (msg.sender != owner) 
        // revert("error"); // Gas 23427 Gas Depend on the Error String Length
        // revert("error error error error error error error error error error error error error error error"); // Gas 23457
        revert NotAuthorized();

        owner.transfer(address(this).balance);
    }
}
