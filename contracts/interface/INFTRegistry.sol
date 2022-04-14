// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface INFTRegistry {

    function createCauseNFT(uint256 id, uint8 tiers, address admin, address cause) external returns(address);
    function createOrgNFT(uint256 id, uint8 tiers, address admin, address org) external returns(address);
    function checkNFTAvailabilityByAmount(uint256 _id, uint256 _amount) external view returns (uint256);
    function checkOrgNFTAvailabilityByAmount(uint256 _id, uint256 _amount) external view returns (uint256);
    function getNFTCauseById(uint256 _id) external view returns(address);
    function getMaxTiers() external view returns(uint256);
    function getNFTContractByCauseId(uint256 _id) external view returns(address);
    function getNFTContractByOrgId(uint256 _id) external view returns(address);
}