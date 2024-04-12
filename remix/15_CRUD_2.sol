// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract AddressBook {
	
    address private owner;  //合約管理者帳號

    //學生資料
    struct student{    
        address account;     //帳號
        string phone;       //電話
        string email;       //Email
    }

    string[] idArray;       //學號陣列
    mapping (string=>student) studentMap;   //學生資料Map
    
    //檢查只有合約管理者帳號可執行
    modifier onlyOwner(){
        require( owner == msg.sender, "Only Owner");
        _;
    }

    //建構式
    constructor() {
        owner = msg.sender;
    }	

    //查詢合約管理者帳號
    function getOwner() public view returns(address account) {
        return owner;
    }

    //設定合約管理者帳號
    function setOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    //新增學生資料
    function create(string memory _id, address _account, string memory _phone, string memory _email) public onlyOwner {
        require(_account == address(_account),"Invalid address");

        (bool find, uint256 index) = getIndexByID(_id);
        if( find == true && index >= 0)
            revert("ID already exists");

        studentMap[_id]= student({ account:_account, phone:_phone, email:_email});
        idArray.push(_id);
    }

    //依據學號修改學生資料
    function update(string memory _id, address _account, string memory _phone, string memory _email) public onlyOwner {       
        require(_account == address(_account),"Invalid address");

        ( bool find, uint256 index) = getIndexByID(_id);
        if( find == false && index==0)
            revert("ID not found");

        studentMap[_id]= student({ account:_account, phone:_phone, email:_email});
    }

    //查詢學號索引
    function getIndexByID(string memory _id) private view returns( bool find, uint256 index) {
        for(uint256 i = 0; i< idArray.length; i++) {
            if(compareStrings(idArray[i],_id) == true)
                return (true, i);
        }
        return (false, 0);
    }

    //字串比對
    function compareStrings(string memory a, string memory b) private pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }

    //依據學號刪除學生資料
    function destroy(string memory _id) public onlyOwner{
        (bool find, uint256 index) = getIndexByID(_id);
        if( find == true && index >= 0){
            deleteIDByIndex(index);
            delete studentMap[_id];
        }
    }
        
    //依據學號刪除學號資料
    function deleteIDByIndex(uint256 index) private {
        if( index >= idArray.length)
            revert("Index error");

        for(uint256 i = index; i< idArray.length-1; i++) {
            idArray[i] =idArray[i+1];
        }
        idArray.pop();
    }

    //依據學號查詢學生資料
    function query(string memory _id) public view returns(address _account, string memory _phone, string memory _email){
        return (studentMap[_id].account, studentMap[_id].phone, studentMap[_id].email);
    }

    //查詢學生資料總數
    function total() public view returns(uint256 length){
        return idArray.length;
    }
}
