// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FlexiTokenERC20 is ERC20 {

    address owner;

    constructor()
        ERC20("FlexiTokenERC20", "FLEXT")
    {   
        owner = msg.sender;
        _mint(msg.sender, 10000 * 10 ** 18);
    }

    // Modifier that ensures only the owner can execute certain functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Mint function restricted to the owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
