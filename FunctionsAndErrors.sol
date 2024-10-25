// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FunctionsAndErrors {
    uint public balance;

    constructor(uint _initialBalance) {
        require(_initialBalance > 0, "Initial balance must be greater than zero.");
        balance = _initialBalance;
    }

    function deposit(uint _amount) public {
        require(_amount > 0, "Deposit amount must be greater than zero.");
        balance += _amount;
    }

    function withdraw(uint _amount) public {
        require(_amount <= balance, "Insufficient balance.");

        uint oldBalance = balance;
        balance -= _amount;
        assert(balance == oldBalance - _amount);
    }

    function resetBalance() public {
        if (balance > 1000) {
            revert("Balance too high, resetting not allowed.");
        }
        balance = 0;
    }
}
