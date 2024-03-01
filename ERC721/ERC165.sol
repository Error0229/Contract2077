pragma solidity ^0.8.0;

// SPDX-License-Identifier: MIT

// ERC 165 
interface ERC165 {
    /// @notice Query if a contract implements an interface
    /// @param interfaceId The interface identifier, as specified in ERC-165
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}
