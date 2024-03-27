// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Mapping {
    // Define a struct
    struct User {
        string name;
        uint8 age;
        string email;
        string phone;
    }
    // Declare a mapping variable
    mapping(string => User) member;

    /**
     * @notice Creates a new Mapping contract
     * @param _id The id of the user
     * @param _name The name of the user
     * @param _age The age of the user
     * @param _email The email of the user
     * @param _phone The phone number of the user
     */
    function createMember(
        string memory _id,
        string memory _name,
        uint8 _age,
        string memory _email,
        string memory _phone
    ) public {
        member[_id] = User({
            name: _name,
            age: _age,
            email: _email,
            phone: _phone
        });
    }

    /**
     * @notice query the member information
     * @param _id The id of the user
     * @return _name The name of the user
     * @return _age The age of the user
     * @return _email The email of the user
     * @return _phone The phone number of the user
     */
    function queryMember(
        string memory _id
    )
        public
        view
        returns (
            string memory _name,
            uint8 _age,
            string memory _email,
            string memory _phone
        )
    {
        return (
            member[_id].name,
            member[_id].age,
            member[_id].email,
            member[_id].phone
        );
    }
}
