// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title Organization interface contract
 */
interface IOrganization {
    function createCause(
        uint256 id,
        uint256 organizationId,
        uint256 goal,
        uint256 endDate,
        address payable wallet,
        string calldata ens,
        uint8 nftTiers) external;
    function isOrganizationAdmin(address admin, uint256 id) external view returns(bool);
}