# Function-and-Error-2---ETH-AVAX
# LotteryDonation Smart Contract

This Solidity smart contract allows users to donate Ether to a lottery pool, where a randomly selected winner receives a portion of the total donations. The contract is managed by a chairperson who has the authority to select the winner.

## Contract Details

**SPDX-License-Identifier:** UNLICENSED  
**Solidity Version:** ^0.8.0

### State Variables

- `chairperson`: Address of the chairperson who deployed the contract.
- `donations`: Mapping to track donations made by each donor.
- `donors`: Array to store addresses of all donors.

### Events

- `Donated`: Emitted when a user donates Ether to the lottery.
- `WinnerSelected`: Emitted when a winner is selected from the donor pool.

### Functions

- `constructor()`: Sets the chairperson to the address of the contract deployer.
- `donate()`: Allows users to contribute Ether to the lottery. Emits the `Donated` event.
- `selectWinner()`: Allows the chairperson to randomly select a winner from the donor pool. Emits the `WinnerSelected` event.
- `isDonor(address _address)`: Checks if an address has donated to the lottery.
- `random()`: Generates a random number for selecting the winner.
- `contractBalance()`: Returns the current balance of the contract.
- `receive()`: Fallback function to allow donations through plain Ether transfers.

## Getting Started

### Prerequisites

- Access to an Ethereum development environment (e.g., Remix IDE, Truffle, or Hardhat).

### Deploying the Contract

#### Compile the Contract:

1. Copy the contract code into your Solidity IDE (e.g., Remix).
2. Ensure the Solidity compiler version is set to ^0.8.0.
3. Compile the contract.

#### Deploy the Contract:

1. Go to the "Deploy & Run Transactions" tab in your IDE.
2. Click on the "Deploy" button to deploy the contract.

### Interacting with the Contract

#### Donate:

- Call the `donate()` function to contribute Ether to the lottery. Ensure to send Ether along with the transaction.

#### Select Winner:

- The chairperson can call the `selectWinner()` function to randomly select a winner from the pool of donors.

#### Check Contract Balance:

- Use `contractBalance()` to view the total Ether held by the contract.

## Authors

- Ritik Kumar (https://www.linkedin.com/in/ritik-kumar-8376ba225/)

## License

This project is licensed under the MIT License - see the LICENSE file for details.

