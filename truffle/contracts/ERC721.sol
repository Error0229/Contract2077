pragma solidity ^0.8.24;
// SPDX-License-Identifier: MIT

import "./IERC721.sol";
import "./ERC165.sol";
import "./IERC721Receiver.sol";
/**
 * @title ERC721 implementation
 * @notice Implementation of the ERC721 interface
 */
contract ERC721 is IERC721, ERC165 {
    mapping(address => uint256) private _balanceOf; // number of token in each account
    mapping(uint256 => address) private _ownerOf; // owner of each token
    mapping(uint256 => address) private _approvals; // approved address for each token
    mapping(address => mapping(address => bool)) private _operatorApprovals; // operator approval for each address
    string public name;
    constructor(string memory _name) {
        name = _name;
    }
    function balanceOf(
        address _owner
    ) external view override returns (uint256) {
        require(_owner != address(0));
        return _balanceOf[_owner];
    }

    function ownerOf(
        uint256 _tokenId
    ) external view override returns (address) {
        return _ownerOf[_tokenId];
    }

    function _isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }
    function safeTransferFrom(
        address _from,
        address _to,
        uint256 _tokenId,
        bytes memory data
    ) external payable override {
        require(
            _from == msg.sender &&
                _to != address(0) &&
                _ownerOf[_tokenId] != address(0)
        );
        _approvals[_tokenId] = address(0);
        _balanceOf[_from] -= 1;
        _balanceOf[_to] += 1;
        _ownerOf[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
        if (!_isContract(_to)) {
            return;
        }
        bytes4 retval = IERC721TokenReceiver(_to).onERC721Received(
            msg.sender,
            _from,
            _tokenId,
            data
        );
        require(retval == IERC721TokenReceiver.onERC721Received.selector);
    }

    function safeTransferFrom(
        address _from,
        address _to,
        uint _tokenId
    ) external payable override {
        require(
            _from == msg.sender &&
                _to != address(0) &&
                _ownerOf[_tokenId] != address(0)
        );
        _approvals[_tokenId] = address(0);
        _balanceOf[_from] -= 1;
        _balanceOf[_to] += 1;
        _ownerOf[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
        if (!_isContract(_to)) {
            return;
        }
        bytes4 retval = IERC721TokenReceiver(_to).onERC721Received(
            msg.sender,
            _from,
            _tokenId,
            ""
        );
        require(retval == IERC721TokenReceiver(_to).onERC721Received.selector);
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) external payable override {
        address owner = _ownerOf[_tokenId];
        require(owner != address(0));
        require(
            owner == msg.sender ||
                _approvals[_tokenId] == msg.sender ||
                _operatorApprovals[owner][msg.sender] == true
        );
        require(owner == _from && _to != address(0));

        _approvals[_tokenId] = address(0);
        _balanceOf[_from] -= 1;
        _balanceOf[_to] += 1;
        _ownerOf[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    }

    function approve(
        address _approved,
        uint256 _tokenId
    ) external payable override {
        address owner = _ownerOf[_tokenId];
        require(owner != address(0));
        require(
            msg.sender == owner || _operatorApprovals[owner][msg.sender] == true
        );
        _approvals[_tokenId] = _approved;
        emit Approval(owner, _approved, _tokenId);
    }

    function setApprovalForAll(
        address _operator,
        bool _approved
    ) external override {
        _operatorApprovals[msg.sender][_operator] = _approved;
        emit ApprovalForAll(msg.sender, _operator, _approved);
    }

    function getApproved(
        uint256 _tokenId
    ) external view override returns (address) {
        return _approvals[_tokenId];
    }

    function isApprovedForAll(
        address _owner,
        address _operator
    ) external view override returns (bool) {
        return _operatorApprovals[_owner][_operator];
    }
    function mint(address _to, uint256 _tokenId) public {
        require(_to != address(0));
        require(_ownerOf[_tokenId] == address(0));
        _balanceOf[_to] += 1;
        _ownerOf[_tokenId] = _to;
        emit Transfer(address(0), _to, _tokenId);
    }

    /**
     * @notice Check if a contract implements an interface
     */
    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual override(ERC165) returns (bool) {
        return interfaceId == type(IERC721).interfaceId;
    }
}
