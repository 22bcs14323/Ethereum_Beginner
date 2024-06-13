
# Token Smart Contract

This repository contains a simple token smart contract written in Solidity.

## Overview

The `Token` contract allows the creation, minting, and burning of tokens. It includes the following features:
- Set token name , token abbreviation and total supply during deployment
- Track total supply of the token
- Maintain balances of token holders
- Mint new tokens to an address
- Burn tokens from an address

## Features

- **Name**: Token name
- **Token Abbreviation**: Token symbol
- **Total Supply**: Total number of tokens in circulation
- **Balances**: Mapping of addresses to their token balances

## Contract Details

### Variables

- `TokenName`: The name of the token.
- `TokenAbbrv`: The symbol of the token.
- `TotalSupply`: The total supply of tokens.
- `balances`: A mapping from addresses to their respective balances.

### Constructor

The constructor initializes the token with a name, symbol, and initial supply.

```solidity
constructor(string memory _tokenName, string memory _tokenAbbrv,uint _totalSupply ){
    TokenName=_tokenName;
    TokenAbbrv=_tokenAbbrv;
    TotalSupply=_totalSupply;
     balances[msg.sender]=TotalSupply;
}
```

### Functions

#### `mint`

Mints new tokens to a specified address.

```solidity
function Mint(address to, uint value) external {
 require(to!=address(0),"You are minting to Zero address");
 balances[to]+=value; 
 TotalSupply +=value;

}
```

#### `burn`

Burns tokens from a specified address.

```solidity
function burn(address from, uint value) external{
    require(from!=address(0),"You are burning from Zero address");
    require(balances[from]>value ,"Insufficient balance to burn");
    balances[from]-=value;
    TotalSupply -=value;
}    

```

## Usage

### Deployment

Deploy the contract by providing the token name, token abbreviation, and initial supply.

```solidity
Token token = new Token("Earth", "ERT", 100);
```

### Minting Tokens

Mint new tokens to an address.

```solidity
token.mint(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 1000);
```

### Burning Tokens

Burn tokens from an address.

```solidity
token.burn(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 500);
```

## License

This project is licensed under the MIT License .

## Author

Your Name - [Pallavi Singh] (anshsingh005171@gmail.com)

---
