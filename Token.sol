// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
import "https://github.com/gaponukz/SolSafeMath/blob/main/SafeMath.sol";
 
contract Token {
    using SafeMath for uint256;

    string public symbol = "TKN";
    string public name = "Token";
    uint8 constant public decimals = 0;
    uint256 constant public _totalSupply = 21000000;
 
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);

    constructor() {
        balances[msg.sender] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }
 
    function transfer(address to, uint tokens) public returns (bool) {
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(msg.sender, to, tokens);

        return true;
    }
 
    function approve(address spender, uint tokens) public returns (bool) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);

        return true;
    }
 
    function transferFrom(address from, address to, uint tokens) public returns (bool) {
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(from, to, tokens);

        return true;
    }
 
    function allowance(address tokenOwner, address spender) public view returns (uint256) {
        return allowed[tokenOwner][spender];
    }
 
    function approveAndCall(address spender, uint256 tokens) public returns (bool) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);

        return true;
    }

    function totalSupply() public pure returns (uint256) {
        return _totalSupply;
    }
 
    function balanceOf(address tokenOwner) public view returns (uint256) {
        return balances[tokenOwner];
    }
}
