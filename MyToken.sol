 /* REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
   // Public variables
    string public name = "Gaurav";
    string public symbol = "GP";
    uint256 public totalSupply = 0;

     // Mapping of addresses to balances it Keeps track of each address's token balance
    mapping(address => uint256) public balances;

  
    // Mint function to allow creating new tokens and assigning them to an address
    function mint(address _account, uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");
        totalSupply += _amount;
        balances[_account] += _amount;
    }

    // Burn function, Allows destroying tokens from an address

    function burn(address _account, uint256 _amount) external {
        require(balances[_account] >= _amount, "Insufficient balance");
        totalSupply -= _amount;
        balances[_account] -= _amount;
    }
}
