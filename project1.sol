// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AtulToken {
    // Public variables to store token details
    string public name = "Donkey";
    string public symbol = "DN";
    uint public totalSupply = 22;

    // Mapping from addresses to balances
    mapping(address => uint) public balances;

    // Constructor to initialize the token details
    constructor() {
        balances[msg.sender] = totalSupply;
    }

    // Function to mint new tokens
    function mint(address _to, uint _value) public {
        totalSupply += _value;
        balances[_to] += _value;
        emit Transfer(address(0), _to, _value);
    }

    // Function to burn tokens
    function burn(address _from, uint _value) public {
        require(balances[_from] >= _value, "Balance is not sufficient for burn");
        totalSupply -= _value;
        balances[_from] -= _value;
        emit Transfer(_from, address(0), _value);
    }

    // Event to log transfers (minting and burning are treated as transfers)
    event Transfer(address indexed _from, address indexed _to, uint _value);
}
