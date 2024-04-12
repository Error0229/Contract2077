// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StudentBase {
    // assume these are unique, if not, they would have undefined behavior
    struct Student {
        address account;
        string email;
        string phone;
    }
    address owner;
    // mapping from student id to student info
    mapping(string => Student) students;
    // these mappings are used to query key by value
    mapping(address => string) account2Id;
    mapping(string => bool) isStudent;
    mapping(string => string) phone2Id;
    mapping(string => string) email2Id;
    // use this to count the number of students
    uint256 studentCount;
    /**
     * @notice Creates a new StudentBase contract
     */
    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Modifier to check if the caller is the owner
     */
    modifier onlyOwner() {
        require(msg.sender == owner, "not the owner");
        _;
    }

    /**
     * @notice Add a new student
     * @param _id The id of the student
     * @param _account The account of the student
     * @param _email The email of the student
     * @param _phone The phone number of the student
     */
    function AddStudent(
        string memory _id,
        address _account,
        string memory _email,
        string memory _phone
    ) public onlyOwner {
        require(!isStudent[_id], "The student already exists");
        students[_id] = Student({
            account: _account,
            email: _email,
            phone: _phone
        });
        account2Id[_account] = _id;
        phone2Id[_phone] = _id;
        email2Id[_email] = _id;
        isStudent[_id] = true;
        studentCount += 1;
    }

    /**
     * @notice Query the id of the student by account
     * @param account The account of the student
     * @return id The id of the student
     */
    function QueryIdByAccount(
        address account
    ) public view onlyOwner returns (string memory) {
        string memory id = account2Id[account];
        require(bytes(id).length != 0, "The account doesn't exist");
        return id;
    }

    /**
     * @notice Query the id of the student by phone
     * @param phone The phone number of the student
     * @return id The id of the student
     */
    function QueryIdbyPhone(
        string memory phone
    ) public view onlyOwner returns (string memory) {
        string memory id = phone2Id[phone];
        require(bytes(id).length != 0, "The account doesn't exist");
        return id;
    }

    /**
     * @notice Query the id of the student by email
     * @param email The email of the student
     * @return id The id of the student
     */
    function QueryIdbyEmail(
        string memory email
    ) public view onlyOwner returns (string memory) {
        string memory id = email2Id[email];
        require(bytes(id).length != 0, "The account doesn't exist");
        return id;
    }

    /**
     * @notice Modify the student information
     * @param id The id of the student
     * @param account The account of the student
     * @param email The email of the student
     * @param phone The phone number of the student
     */
    function ModifyStudent(
        string memory id,
        address account,
        string memory email,
        string memory phone
    ) public onlyOwner {
        require(isStudent[id], "The student doesn't exist");
        // remove the old value
        address oldAccount = students[id].account;
        string memory oldEmail = students[id].email;
        string memory oldPhone = students[id].phone;
        delete account2Id[oldAccount];
        delete phone2Id[oldPhone];
        delete email2Id[oldEmail];
        // add the new value
        students[id] = Student({account: account, email: email, phone: phone});
        account2Id[account] = id;
        phone2Id[phone] = id;
        email2Id[email] = id;
    }

    /**
     * @notice Delete the student
     * @param id The id of the student
     */
    function DeleteStudent(string memory id) public onlyOwner {
        require(isStudent[id], "The student doesn't exist");
        address account = students[id].account;
        string memory email = students[id].email;
        string memory phone = students[id].phone;
        delete students[id];
        delete account2Id[account];
        delete phone2Id[phone];
        delete email2Id[email];
        isStudent[id] = false;
        studentCount -= 1;
    }

    /**
     * @notice Query the student information
     * @param id The id of the student
     * @return account The account of the student
     * @return email The email of the student
     * @return phone The phone number of the student
     */
    function QueryStudent(
        string memory id
    ) public view onlyOwner returns (address, string memory, string memory) {
        require(isStudent[id], "The student doesn't exist");
        return (students[id].account, students[id].email, students[id].phone);
    }

    /**
     * @notice Query the total number of students
     * @return length The total number of students
     */
    function TotalStudent() public view onlyOwner returns (uint256) {
        return studentCount;
    }
}
