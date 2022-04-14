// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title Comptroller Lens interface contract
 */
interface IComptrollerLens {
    function markets(address) external view returns (bool, uint);
    function getAccountLiquidity(address) external view returns (uint, uint, uint);
    function claimComp(address) external;
    function compAccrued(address) external view returns (uint);
}