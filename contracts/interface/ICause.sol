// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title Cause interface contract
 */
interface ICause {
    function createCause(
        uint256 id,
        uint256 goal,
        uint256 endDate,
        address admin,
        address payable wallet,
        string calldata ens,
        address tokenAddress,
        address cTokenAddress,
        uint8 NFTTIers
        ) external returns (address);
}