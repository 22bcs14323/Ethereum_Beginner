// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

/*
       REQUIREMENTS
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

contract MyToken {

    // public variables here
 string public TokenName;
 string public TokenAbbrv;
 uint public TotalSupply;
 
    // mapping variable here
mapping(address=>uint) public balances;

constructor(string memory _tokenName, string memory _tokenAbbrv,uint _totalSupply ){
    TokenName=_tokenName;
    TokenAbbrv=_tokenAbbrv;
    TotalSupply=_totalSupply;
     balances[msg.sender]=TotalSupply;
}

    // mint function
function Mint(address to, uint value) external {
 require(to!=address(0),"You are minting to Zero address");
 balances[to]+=value; 
 TotalSupply +=value;

}
    // burn function
function burn(address from, uint value) external{
    require(from!=address(0),"You are burning from Zero address");
    require(balances[from]>value ,"Insufficient balance to burn");
    balances[from]-=value;
    TotalSupply -=value;

}    

}
