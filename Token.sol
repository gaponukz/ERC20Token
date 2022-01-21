// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

import "ERC20.sol";

contract Token is ERC20 {
    // add commission for transactions
    function transfer(address from, address to, uint256 amount) virtual override public {
        uint256 commission = amount / 100;
        require(balances[from] > (amount + commission));
        require(allowed[msg.sender][from] > (amount + commission));

        super.transfer(from, to, amount);

        balances[from] -= commission;
        allowed[msg.sender][from] -= commission;
        balances[msg.sender] += commission;
    }
}
