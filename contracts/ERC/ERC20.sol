//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;
import "./IERC20.sol";

contract ERC20 is IERC20 {
    uint256 public totalsupply;
    mapping(address => uint256) public balance;
    mapping(address => mapping(address => uint256)) public allowances;

    string public name = "Neontrix";
    string public symbol = "NTX";
    uint8 public decimal = 18;

    function balanceOf(address account)
        external
        view
        override
        returns (uint256)
    {
        return balance[account];
    }

    function decimals() external view override returns (uint8) {
        return decimal;
    }

    function allowance(address owner, address spender)
        external
        view
        override
        returns (uint256)
    {
        return allowances[owner][spender];
    }

    function totalSupply() external view override returns (uint256) {
        return totalsupply;
    }

    function transfer(address receiver, uint256 amount)
        external
        override
        returns (bool)
    {
        balance[msg.sender] -= amount;
        balance[receiver] += amount;
        emit Transfer(msg.sender, receiver, amount);
        return true;
    }

    function approve(address spender, uint256 amount)
        external
        override
        returns (bool)
    {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external override returns (bool) {
        allowances[from][msg.sender] = amount;
        balance[from] -= amount;
        balance[to] += amount;

        emit Transfer(from, to, amount);
        return true;
    }

    function mint(uint256 amount) external {
        balance[msg.sender] += amount;
        totalsupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint256 amount) external {
        balance[msg.sender] -= amount;
        totalsupply -= amount;
        emit Transfer(msg.sender, address(this), amount);
    }
}
