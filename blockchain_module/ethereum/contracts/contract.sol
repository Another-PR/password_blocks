pragma solidity ^0.4.17;
pragma experimental ABIEncoderV2;


contract BuilderContract{

    mapping(address => address) private usersPasswordContracts;

    function createPasswordWallet() public{
        address userPasswords = new UserPasswords(msg.sender);
        usersPasswordContracts[msg.sender] = userPasswords;
    }

    function getUserPasswordContract() public view returns (address){
        return usersPasswordContracts[msg.sender];
    }
    
}
contract UserPasswords{
    struct LoginCred{
        string description;
        string username;
        string password;
        int index;
    }
    int indexCred=0;
    LoginCred[] private loginCreds;
    address public manager;

     function UserPasswords(address user) public{
        manager  = user;
    }

    function addCred(string des, string un, string pass) public {
        require(msg.sender==manager);
        LoginCred memory newCred =  LoginCred({description:des, username:un, password:pass, index: indexCred});
        loginCreds.push(newCred);
        indexCred=  indexCred+1;

    }
    function getCreds() public view returns (LoginCred[] memory){
        require(msg.sender==manager);
        return loginCreds;
    }

    function editCreds(uint256 pos, string des, string un, string pass) public{
        require(msg.sender==manager);
        loginCreds[pos].description = des;
        loginCreds[pos].username=un;
        loginCreds[pos].password=pass;
    }

}