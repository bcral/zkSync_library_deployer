// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title Cause Registry interface contract
 */
interface ICauseRegistry {
    function createCause(
        uint256 id,
        uint256 organizationId,
        uint256 goal,
        uint256 endDate,
        address admin,
        address payable wallet,
        string calldata ens,
        address tokenAddress,
        uint8 NFTTiers
    ) external;
    function addCauseAdmin(uint256 id, address newAdmin) external;
    function removeCauseAdmin(uint256 id, address admin) external;
    function updateAmountRaised(uint256 id, uint256 amount) external;
    function createEscrowedCause(
        uint256 id,
        uint256 organizationId,
        uint256 goal,
        uint256 endDate,
        address cTokenAddress,
        address escrowedAdmin,
        address wallet,
        string calldata ens,
        uint8 NFTTiers
    ) external returns (address causeAddress);
    function getCauseDetailsForDonation(uint256 id) external view returns (
        uint256 amountRaised,
        uint256 goal,
        address wallet,
        address tokenAddress
    );
    function isValidForDonation(uint256 id) external view returns (bool);
    function isEscrowedStandard(uint256 id) external view returns (bool);
    function isEscrowedERC20(uint256 id) external view returns (bool);
    function causeExists(uint256 id) external view returns (bool);
    function isCauseAdmin(uint256 id, address addr) external view returns (bool);
    function getOrganizationIdForCause(uint256 id) external view returns (uint256 organizationId);
    function getEscrowedCauseAddress(uint256 id) external view returns (address causeAddress);
    function getEscrowedERC20CauseAddress(uint256 id) external view returns (address causeAddress);
    function pauseCause(uint256 id) external;
    function unpauseCause(uint256 id) external;
    function endCause(uint256 id) external;
}