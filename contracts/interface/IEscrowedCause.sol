// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title Escrowed Cause interface contract
 */
interface IEscrowedCause {
    function pause() external;
    function unpause() external;
    function end() external;
    function enableRefunds() external;
    function transferFunds(address payable to) external;
    function grantRole(bytes32 role, address account) external;
    function revokeRole(bytes32 role, address account) external;
    function donateETH(address sender, uint256 tipAmount, bool mintNFT) payable external;
}