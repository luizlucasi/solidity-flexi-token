// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title FlexiTokenERC20
/// @dev This contract implements a customizable ERC20 token using OpenZeppelin's ERC20 standard.
///      The contract includes functionality for minting tokens, with minting rights restricted to the contract owner.
///      It inherits the ERC20 implementation from OpenZeppelin, allowing for basic token operations like transfer, approve, and balance checks.
///
///      The total initial supply of tokens is 10,000 units with 18 decimal places of precision, 
///      equivalent to 10,000 * 10^18 base units (similar to 'wei' in Ether).
///
///      FlexiTokenERC20 also includes a customizable minting function, restricted by an `onlyOwner` modifier 
///      that ensures only the contract owner can mint new tokens.
///
/// @dev Created for educational purposes, highlighting the integration of OpenZeppelin's contracts and owner-restricted minting.
contract FlexiTokenERC20 is ERC20 {

    // The address of the contract owner, who has special privileges like minting new tokens
    address owner;

    /// @notice Contract constructor that initializes the token's name, symbol, and mints the initial supply of 10,000 tokens to the deployer.
    /// @dev The constructor calls the ERC20 constructor with the name and symbol of the token. It also mints 10,000 tokens to the deployer's address.
    constructor()
        ERC20("FlexiTokenERC20", "FLEXT")
    {   
        // Sets the contract deployer as the owner, who will have special privileges such as minting.
        owner = msg.sender;
        
        // Mint an initial supply of 10,000 tokens with 18 decimal places of precision.
        // The total minted is 10,000 * 10^18 base units.
        _mint(msg.sender, 10000 * 10 ** 18);
    }

    /// @dev Modifier to restrict access to certain functions to only the contract owner.
    ///      Any function using this modifier can only be called by the owner.
    /// @dev Throws an error if called by any account other than the owner.
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    /// @notice Mints new tokens and assigns them to a specified address.
    /// @dev This function is restricted to the contract owner using the `onlyOwner` modifier.
    ///      This ensures that only the contract owner can expand the token supply.
    /// @param to The address to which the newly minted tokens will be assigned.
    /// @param amount The number of tokens (in base units, i.e., including decimal places) to mint.
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
