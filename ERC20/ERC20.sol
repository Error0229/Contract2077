pragma solidity >=0.4.17;
// SPDX-License-Identifier: MIT
import "./IERC20.sol";
/**
 * @title ERC20 implementation
 * @dev Implementation of the ERC20 interface
 */
contract ERC20 is IERC20 {
    /**
     * @dev The name of the token
     */
    string public name;
    /**
     * @dev The symbol of the token
     */
    string public symbol;
    /**
     * @dev The number of decimals of the token
     */
    uint8 public decimals;
    uint256 private _totalSupply;
    mapping (address => uint256) private _balanceOf; // balance of each account
    mapping (address => mapping (address => uint256)) private _allowance; // allowance for each account for each spender

    /**
     * @dev Constructor
     * @param name The name of the token
     * @param symbol The symbol of the token
     * @param decimals The number of decimals of the token
     * @param totalSupply The total supply of the token
     */
    constructor (string name, string symbol, uint8 decimals, uint256 totalSupply) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
        _totalSupply = totalSupply;
        _balanceOf[msg.sender] = totalSupply;
    }

    /**
     * @dev Returns the total supply of the token
     * @return totalSupply The total supply of the token
     */
    function totalSupply() public view returns (uint256 totalSupply) {
        return _totalSupply;
    }

    /**
     * @dev Returns the balance of the specified address
     * @param _owner The address to query the balance of
     * @return balance The balance of the specified address
     */
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return _balanceOf[_owner];
    }

    /**
     * @dev Transfers tokens from the message sender to the specified address
     * @param _to The address to transfer to
     * @param _value The amount to be transferred
     * @return success true if the transfer was successful, false otherwise
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require (_balanceOf[msg.sender] >= _value);
        _balanceOf[msg.sender] -= _value;
        _balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value); // emit the Transfer event
        return true;
    }

    /**
     * @dev Transfers tokens from a specified address to another specified address
     * @param _from The address to transfer from
     * @param _to The address to transfer to
     * @param _value The amount to be transferred
     * @return success true if the transfer was successful, false otherwise
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require (_balanceOf[_from] >= _value, _allowance[_from][msg.sender] >= _value);
        _balanceOf[_from] -= _value;
        _balanceOf[_to] += _value;
        _allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value); // emit the Transfer event
        return true;
    }

    /**
     * @dev Approves the specified address to spend the specified amount of tokens on behalf of the message sender
     * @param _spender The address to be approved to spend the tokens
     * @param _value The amount of tokens to be approved to be spent
     * @return success true if the approval was successful, false otherwise
     */
    function approve(address _spender, uint256 _value) public returns (bool success) {
        _allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); // emit the Approval event
        return true;
    }

    /**
     * @dev Returns the amount of tokens that the specified address is allowed to spend on behalf of the message sender
     * @param _owner The address that is allowed to spend the tokens
     * @param _spender The address that is allowed to spend the tokens
     * @return remaining The amount of tokens that the specified address is allowed to spend on behalf of the message sender
     */
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return _allowance[_owner][_spender];
    }

}
