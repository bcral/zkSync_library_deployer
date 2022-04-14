// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title Admin interface contract
 */
interface IAdmin {
    function isSuperAdmin(address account) external view returns (bool);
    function setAdmin(address account, uint256 id) external returns(bool);
}
