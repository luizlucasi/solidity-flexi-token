# Custom ERC-20 Token (FLEXITOKEN,FLKEX)

## Project Overview

This project implements a **custom ERC-20 token** using the OpenZeppelin library. The additional features include:

- **Capped supply**: A maximum supply limit ensures the total number of tokens cannot exceed a predefined amount.
- **Burn mechanism**: Token holders can burn tokens to permanently reduce the total supply.
- **Dynamic transfer fees**: A transaction fee, adjustable by the owner, is applied to each transfer and sent to a designated fee wallet.

This project is designed to demonstrate how to create **secure and efficient smart contracts** following the widely used **ERC-20 standard**. It's built as a learning and portfolio showcase to deepen my understanding of Solidity and decentralized applications (dApps).

## Key Technologies

- **Solidity**: A programming language used to develop smart contracts on the Ethereum blockchain.
- **OpenZeppelin**: A popular library for building secure smart contracts, providing templates for ERC-20 tokens.
- **Hardhat**: A development environment for compiling, deploying, testing, and debugging Ethereum contracts.
- **Node.js**: The platform used to run the project scripts and automate tasks like deployment and testing.

## Features Explained

1. **Capped Supply**  
   The total token supply is capped to a maximum limit defined during contract deployment. This feature prevents over-minting and ensures scarcity.

2. **Token Burning**  
   The burn function allows token holders to destroy tokens they own, which permanently reduces the circulating supply. This feature can help manage inflation or create scarcity.

3. **Dynamic Transfer Fee**  
   The owner of the contract can modify the transfer fee in real-time. A portion of each transaction is deducted as a fee and sent to a specific fee wallet, providing an ongoing revenue stream for the wallet holder.

## Project Structure

```bash
flexi-token/
├── contracts/                   # Solidity contracts
│   └── FlexitokenERC20.sol           # Custom ERC-20 token implementation
├── scripts/                     # Deployment and interaction scripts
│   └── deploy.js                 # Deployment script for the contract
├── test/                        # Unit tests
│   └── FlexitokenERC20.test.js       # Test cases for the contract
├── README.md                    # Project documentation
├── .gitignore                   # Files and folders to be ignored by Git
├── hardhat.config.js            # Hardhat configuration file
└── package.json                 # Project dependencies
