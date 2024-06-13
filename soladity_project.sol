// SPDX-License-Identifier: MIT
/*
1 Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
2 Your contract will have a mapping of addresses to balances (address => uint)
3 You will have a mint function that takes two parameters: an address and a value. The function then increases the total supply by that number and increases the balance of the address by that amount.
4 Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. It will take an address and value just like the mint functions. It will then deduct the value from the total supply and from the balance of the address.
5 Lastly, your burn function should have conditionals to make sure the balance of account is greater than or equal to the amount that is supposed to be burned.
*/
pragma solidity 0.8.9;

contract Myproject {

    // Public variables to store the details about the coin
    string public firm_name = "MGP COmpany";
    string public short_form = "MGP";   
    uint256 public netProfit;     

    // Mapping from addresses to balances
    mapping(address => uint256) public balances;

    // Mint function to create new tokens
    function mint(address to, uint256 value) public {
        netProfit += value;         // Increase the total supply by the minted amount
        balances[to] += value;        // Increase the balance of the recipient
    }

    // Burn function to destroy tokens
    function burn(address from, uint256 value) public {
        require(balances[from] >= value, "Insufficient balance to burn"); // Ensure the sender has enough balance
        netProfit -= value;         // Decrease the total supply by the burned amount
        balances[from] -= value;      // Decrease the balance of the sender
    }
}
