pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'BakerRole' to manage this role - add, remove, check
contract BakerRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event BakerAdded(address indexed account);
  event BakerRemoved(address indexed account);

  // Define a struct 'bakers' by inheriting from 'Roles' library, struct Role
  Roles.Role private bakers;

  // In the constructor make the address that deploys this contract the 1st baker
  constructor() public {
    _addBaker(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyBaker() {
    require(isBaker(msg.sender));
    _;
  }

  // Define a function 'isBaker' to check this role
  function isBaker(address account) public view returns (bool) {
    return bakers.has(account);
  }

  // Define a function 'addBaker' that adds this role
  function addBaker(address account) public onlyBaker {
    _addBaker(account);
  }

  // Define a function 'renounceBaker' to renounce this role
  function renounceBaker() public {
    _removeBaker(msg.sender);
  }

  // Define an internal function '_addBaker' to add this role, called by 'addBaker'
  function _addBaker(address account) internal {
    bakers.add(account);
    emit BakerAdded(account);
  }

  // Define an internal function '_removeBaker' to remove this role, called by 'removeBaker'
  function _removeBaker(address account) internal {
    bakers.remove(account);
    emit BakerRemoved(account);
  }
}