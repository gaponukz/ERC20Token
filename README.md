# ERC20 standard  Token
ERC20 standard defines a set of functions to be implemented by all ERC20 tokens so as to allow integration with other contracts, wallets, or marketplaces. This set of functions is rather short and basic.
```sol
function totalSupply() public view returns (uint256);
function balanceOf(address tokenOwner) public view returns (uint);
function allowance(address tokenOwner, address spender) public view returns (uint);
function transfer(address to, uint tokens) public returns (bool);
function approve(address spender, uint tokens)  public returns (bool);
function transferFrom(address from, address to, uint tokens) public returns (bool);
```
ERC20 functions allow an external user, say a crypto-wallet app, to find out a user’s balance and transfer funds from one user to another with proper authorization.
