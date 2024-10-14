// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title FlexiTokenERC20 - A customizable ERC20 token contract.
/// @author Lucasi
/// @notice This contract implements an ERC20 token using OpenZeppelin's ERC20 standard.
/// @dev The contract includes minting functionality restricted to the contract owner, a total token supply limit, and can be paused in case of emergency.
contract FlexiTokenERC20 is ERC20, Ownable, ERC20Pausable {
    // The maximum supply of tokens that can ever be minted.
    uint256 public constant MAX_SUPPLY = 20000 * 10 ** 18;

    /// @notice Contract constructor that initializes the token's name, symbol, and mints the initial supply of 10,000 tokens to the deployer.
    /// @dev The constructor calls the ERC20 constructor with the name and symbol of the token. It also mints 10,000 tokens to the deployer's address.
    constructor(
        address initialOwner
    ) ERC20("FlexiTokenERC20", "FLEXT") Ownable(initialOwner) {
        // Mint an initial supply of 10,000 tokens to the deployer's address.
        _mint(msg.sender, 10000 * 10 ** 18);
    }

    /// @notice Mints new tokens and assigns them to a specified address.
    /// @dev This function is restricted to the contract owner using the `onlyOwner` modifier.
    ///      It checks that the total supply after minting does not exceed the maximum supply.
    /// @param to The address to which the newly minted tokens will be assigned.
    /// @param amount The number of tokens (in base units, i.e., including decimal places) to mint.
    function mint(address to, uint256 amount) public onlyOwner whenNotPaused {
        require(
            totalSupply() + amount <= MAX_SUPPLY,
            "Cannot mint beyond the maximum supply"
        );
        _mint(to, amount);
    }

    /// @notice Pauses all token transfers and minting.
    /// @dev Can only be called by the contract owner. This can be useful in emergencies.
    function pause() public onlyOwner {
        _pause();
    }

    /// @notice Unpauses all token transfers and minting.
    /// @dev Can only be called by the contract owner to resume operations after being paused.
    function unpause() public onlyOwner {
        _unpause();
    }

    // The following functions are overrides required by Solidity.
    /**
     * @dev Internal function that updates the balance of `from` and `to` addresses based on the `value` transferred.
     *      This function overrides the `_update` functions in both `ERC20` and `ERC20Pausable`.
     *      It calls the parent `_update` function using `super`.
     *
     * @param from The address sending the tokens.
     * @param to The address receiving the tokens.
     * @param value The amount of tokens being transferred.
     *
     * @notice This function is called during token transfers and handles balance updates.
     *         If the contract is paused (due to `ERC20Pausable`), transfers may be restricted.
     * @dev Uses the `override` keyword to ensure that both `ERC20` and `ERC20Pausable` implementations are called.
     */
    function _update(
        address from,
        address to,
        uint256 value
    ) internal override(ERC20, ERC20Pausable) {
        super._update(from, to, value);
    }

    /**
     * @dev Transfers `amount` of tokens from the caller's account (`msg.sender`) to the specified `to` address.
     *
     * This function acts as a wrapper around the standard ERC20 `transfer` function, simplifying the process for users
     * to transfer tokens from their own account.
     *
     * @param to The address of the recipient to whom the tokens will be sent.
     * @param amount The number of tokens to transfer (including decimal places if applicable).
     *
     * @notice This function calls the `transfer` function inherited from the ERC20 standard contract.
     * The caller must have a sufficient token balance to execute this transfer.
     */
    function transferTokens(address to, uint256 amount) public {
        transfer(to, amount);
    }
}
