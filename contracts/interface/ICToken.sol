// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title Compound interface contract
 */
interface ICToken {
    function mint(uint mintAmount) external returns (uint256); // For ERC20
    function exchangeRateCurrent() external returns (uint256);
    function exchangeRateStored() external view returns (uint);
    function accrueInterest() external returns (uint256); 
    function approve(address spender, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function balanceOfUnderlying(address owner) external returns (uint);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function redeem(uint redeemTokens) external returns (uint);
    function underlying() external view returns (address);
    function comptroller() external view returns (address);
}