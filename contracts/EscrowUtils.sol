// SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

import "./interface/IRegistry.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @title ERC20 Utils library
 */
library EscrowUtils {
    
    /// @notice This function transfers tokens to tipWallets
    /// @param amount of tokens to transfer to tipWallets
    /// @param registryAddress Address of the Registry contract
    /// @param tokenAddress Token address to be transferred
    function transferToAdmins(uint256 amount, address registryAddress, address tokenAddress)
        internal
    {
        IRegistry registry = IRegistry(registryAddress);
        IERC20 token = IERC20(tokenAddress);
        address[] memory wallets = registry.getWalletContract().getTipWallets();
        
        for (uint256 i = 0; i < wallets.length; i++) {
            uint256 percent = registry.getWalletContract().getTipWalletSplit(wallets[i]);
            uint256 split = (amount * percent) / 100;
            token.transfer(address(wallets[i]), split);
        }
    }

}