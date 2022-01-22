// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract ERC20 {
    uint256 constant _totalSupply = 21000000;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);

    constructor () {
        balances[msg.sender] = _totalSupply;
        allowed[msg.sender][msg.sender] = _totalSupply;
    }

    function transfer(address _address, uint256 amount) public {
        balances[msg.sender] -= amount;
        balances[_address] += amount;

        emit Transfer(msg.sender, _address, amount);
    }

    function transferFrom(address from, address to, uint256 amount) virtual public {
        require(balances[from] > amount);
        require(allowed[from][msg.sender] > amount);

        balances[to] += amount;
        balances[from] -= amount;
        allowed[from][msg.sender] -= amount;

        emit Transfer(from, to, amount);
    }

    function approve(address delegate, uint256 amount) public returns (bool) {
        allowed[msg.sender][delegate] = amount;
        emit Approval(msg.sender, delegate, amount);

        return true;
    }

    function allowance(address owner, address delegate) public view returns (uint256) {
        return allowed[owner][delegate];
    }

    function totalSupply() public pure returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address tokenOwner) public view returns (uint256) {
        return balances[tokenOwner];
    }
}
