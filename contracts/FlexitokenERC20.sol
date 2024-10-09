// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract FlexiTokenERC20 is ERC20, ERC20Permit {
    constructor() ERC20("FlexiToken", "FLEXT") ERC20Permit("MyToken") {}
}