// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Struct {
    // Define a struct
    struct User {
        string name;
        uint8 age;
        string email;
        string phone;
    }

    User member; // Declare a variable of type User

    /**
     * @notice Creates a new Struct contract
     * @param _name The name of the user
     * @param _age The age of the user
     * @param _email The email of the user
     * @param _phone The phone number of the user
     */
    constructor(
        string memory _name,
        uint8 _age,
        string memory _email,
        string memory _phone
    ) {
        member = User({name: _name, age: _age, email: _email, phone: _phone});
        //member.name = _name;
        //member.age = _age;
        //member.email = _email;
        //member.phone = _phone;
    }
    /**
     * @notice query the name of the user
     * @return name The name of the user
     */
    function queryName() public view returns (string memory) {
        return member.name;
    }
    /**
     * @notice query the age of the user
     * @return age The age of the user
     */
    function queryAge() public view returns (uint8) {
        return member.age;
    }
    /**
     * @notice query the email of the user
     * @return email The email of the user
     */
    function queryEmail() public view returns (string memory) {
        return member.email;
    }
    /**
     * @notice query the phone number of the user
     * @return phone The phone number of the user
     */
    function queryPhone() public view returns (string memory) {
        return member.phone;
    }
}
