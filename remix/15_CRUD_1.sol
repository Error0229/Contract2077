// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract CRUD {
    
    struct Student{
        string id;
        address account;
        string name;
        string phone;
        string email;
    }
    
    Student[] students;

    constructor() {
    }
    
    function create(string calldata _id, string calldata _name, string calldata _phone, string calldata _email) public {
        Student memory student = Student({ id: _id, account: msg.sender, name: _name, phone: _phone, email: _email});
        students.push(student);
    }
    
    function getIndexByAccount() public view returns( uint256 index) {
        for(uint256 i = 0; i< students.length; i++) {
            if(students[i].account == msg.sender)
                return i;
        }
        revert("Student not found");
    }
    
    function getIndexById(string calldata _id) public view returns( uint256 index) {
        for(uint256 i = 0; i< students.length; i++) {
            if(keccak256(abi.encodePacked(students[i].id)) == keccak256(abi.encodePacked(_id)))
                return i;
        }
        revert("Student not found");
    }

    function read(uint256 _index) public view returns(string memory id, address account, string memory name, string memory phone, string memory email) {
        return ( students[_index].id, students[_index].account, students[_index].name, students[_index].phone, students[_index].email);
    }
    
    function find(string calldata _id) public view returns(string memory id, address account, string memory name, string memory phone, string memory email) {
        for(uint256 i = 0; i< students.length; i++) {
            if(keccak256(abi.encodePacked(students[i].id)) == keccak256(abi.encodePacked(_id)))
                return read(i);
        }
        revert("Student not found");
    }
    
    function update(string calldata _id, address _account, string calldata _name, string calldata _phone, string calldata _email) public {
        uint256 index = getIndexById(_id);
        students[index].account = _account;
        students[index].name = _name;
        students[index].phone = _phone;
        students[index].email = _email;
    }
    
    function destroy(string calldata _id) public {
        uint256 index = getIndexById(_id);
        delete students[index];
    }
}