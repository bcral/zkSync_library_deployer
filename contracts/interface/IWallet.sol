// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title Fundraising interface contract
 */
interface IWallet {
    function transferTip(uint256 tipAmount) external payable;
    function updateWallets(address[] calldata _tipWallets, uint256[] calldata _percents) external returns (bool);
    function addFundWallet(address payable wallet) external returns (bool);
    function getTipWallets() external view returns (address[] memory);
    function getTipWalletSplit(address wallet) external view returns (uint256);
}
