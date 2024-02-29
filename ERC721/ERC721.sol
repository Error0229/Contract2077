pragma solidity ^0.8.0;
// SPDX-License-Identifier: MIT

import "./IERC721.sol";

/**
 * @title ERC721 implementation
 * @notice Implementation of the ERC721 interface
 */

contract ERC721 is IERC721 {
    mapping (address => uint256) private _balanceOf; // number of token in each account
    mapping (uint256 => address) private _ownerOf; // owner of each token
    function balanceOf(address _owner) external view returns (uint256){
        require (_owner != address(0));
        return _balanceOf[_owner];
    }
    function ownerOf(uint256 _tokenId) external view return (address){
        return _ownerOf[_tokenId];
    }
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable{

    }




}
