# Functions and Errors - A Metacrafters Project for ETH + AVAX Proof

For this project, I wrote a smart contract that implements the require(), assert() and revert() statements.

## Description

This project simulates a logical transactions of a simple an Automatic Teller Machine(ATM), with a constant set starting balance. This smart contract has the capability to withdraw, deposit, and reset the balance.

## Getting Started

### Installing

1. Install [Node.js](https://nodejs.org)

   Download and install from the official site.

2. Install [Truffle](https://github.com/trufflesuite/truffle)

   ```bash
   npm install -g truffle

### Executing program

To run this program, use the Gitpod tools that is given provided by the Metacrafters.

##Initialize
1. Initialize Truffle in your project folder

   ```bash
   truffle init
   ```

   After initialization, you will find two folders called `contracts` and `migrations`. Contracts go in the `contracts` folder while contract deployment settings go in `migrations`.

2. The "FunctionsAndErrors" contract
   "FunctionsAndErrors.sol" in `contracts` contains the following code:
   
    ```
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
    ```
    
3. Prepare the migration
   
   "2_deploy_FAE.js" in `migrations` contains the following code:
    Create another file in the js file:
   
   ```
   const FunctionsAndErrors = artifacts.require("FunctionsAndErrors");
    
   module.exports = function (deployer) {
     const initialBalance = 100; // replace with any
     deployer.deploy(FunctionsAndErrors, initialBalance);
   };
   ```
   
4. Start Truffle console in development mode

   ```bash
   truffle develop
   ```

   In the Truffle console, execute

   ```bash
   compile
   migrate
   ```
   If you want to remigrate existing contracts, run `migrate --reset` instead of simply `migrate`.

## Authors

John Gabriel T. Pagtlaunan
@202120016@fit.edu.ph
@j.g.pagtalunan14@gmail.com

## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
