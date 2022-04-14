// SPDX-License-Identifier: MIT

pragma solidity ^0.8.6;

import "./interface/IRegistry.sol";
import "./interface/IUniswapV2Router02.sol";

/**
 * @title Uniswap helper contract
 * @dev Helper contract to manage Uniswap interaction
 */

library UniswapHelper {

    // Constant used for Uniswap
    uint256 constant DEADLINE = 1099511627776;

    /// @notice Returns the price of the tokens's price getAmountsOut
    /// @dev The uniswap function returns an array the same size as the path of tokens parameter
    /// @dev The array positions represents, respectively, the input of ETH amount and the token price
    /// @param ethAmount Amount to get price
    /// @return Token price
    function _getTokensPrice(
        IUniswapV2Router02 uniswapRouter,
        uint256 ethAmount,
        address tokenAddress
    ) 
        internal view returns (uint256)
    {
        // The second position of returned the array is the token price
        return uniswapRouter.getAmountsOut(ethAmount, _getPathForETHtoToken(uniswapRouter, tokenAddress))[1];
    }

    /// @notice Function to swap ETH to an ERC-20 using Uniswap
    /// @dev The uniswap function returns an array the same size as the path of tokens parameter
    /// @dev The array positions represents, respectively, the input of ETH amount and the tokens swapped 
    /// @param ethAmount Input in Eth to swap
    /// @param tokenAddress of ERC-20 to swap to
    /// @param to Address to send swapped tokens
    /// @return swapped tokens
    function _swapEthForTokens(
        IUniswapV2Router02 uniswapRouter,
        uint256 ethAmount,
        address tokenAddress,
        address to
    )
        public
        returns (uint256)
    {
        // solhint-disable-next-line
        return uniswapRouter.swapExactETHForTokens{value: ethAmount}(
            1, // min token amount out
            _getPathForETHtoToken(uniswapRouter, tokenAddress),
            to,
            DEADLINE
        )[1]; // Amount of tokens after swap
    }

    /// @notice Makes the path to be used raisedin the swap
    /// @param tokenAddress of ERC-20 to swap to
    /// @return Array of addresses
    function _getPathForETHtoToken(IUniswapV2Router02 uniswapRouter, address tokenAddress) 
        private
        pure
        returns (address[] memory)
    {
        address[] memory path = new address[](2);
        path[0] = uniswapRouter.WETH();
        path[1] = tokenAddress;
        
        return path;
    }
}