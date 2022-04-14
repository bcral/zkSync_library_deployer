// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IAdmin.sol";
import "./IWallet.sol";
import "./ICause.sol";
import "./ICauseRegistry.sol";
import "./IOrganization.sol";
import "./IUniswapV2Router02.sol";
import "./INFTRegistry.sol";

/**
 * @title Registry interface contract
 */
interface IRegistry {
    function getAdminContract() external view returns (IAdmin);
    function getWalletContract() external view returns (IWallet);
    function getCauseContract() external view returns (ICause);
    function getCauseRegistryContract() external view returns (ICauseRegistry);
    function getOrgContract() external view returns (IOrganization);    
    function getUniswapV2Router02() external view returns (IUniswapV2Router02);
    function COMPaddress() external view returns (address);
    function getNFTRegistry() external view returns(INFTRegistry);
}