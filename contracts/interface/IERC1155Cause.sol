// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/**
 * @title ERC20 Escrow contract
 * @dev Escrow contract for causes that accepts stablecoins
 */
interface IERC1155Cause {

    function checkAvailability(uint256 id) external view returns(uint256);
    function getTotalTiers() external view returns(uint8);
    function createNewTier(uint256 _threshold, uint256 _totalSupply, string calldata _uri) external;
    function getTierById(uint256 _id) external view returns(uint256, uint256, string memory);
    function isMintable() external view returns(bool);
    function mint(address account, uint256 _id) external returns(bool);
    function getCause() external view returns(address);
    function pause() external returns(bool);
    function unPause() external returns(bool);
}