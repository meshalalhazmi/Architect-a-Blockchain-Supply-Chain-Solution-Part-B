pragma solidity ^0.4.24;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'DistributorRole' to manage this role - add, remove, check
contract DeliveryAgentRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event deliveryAgentAdded(address indexed account);
  event deliveryAgentRemoved(address indexed account);

  // Define a struct 'deliveryAgents' by inheriting from 'Roles' library, struct Role
  Roles.Role private deliveryAgents;

  // In the constructor make the address that deploys this contract the 1st deliveryAgent
  constructor() public {
 
    _addDeliveryAgent(msg.sender);

  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyDeliveryAgent() {
    require(isDeliveryAgent(msg.sender));

    _;
  }

  // Define a function 'isDeliveryAgent' to check this role
  function isDeliveryAgent(address account) public view returns (bool) {
    return deliveryAgents.has(account);

  }

  // Define a function 'addDeliveryAgent' that adds this role
  function addDeliveryAgent(address account) public onlyDeliveryAgent {
    _addDeliveryAgent(account);

  }

  // Define a function 'renounceDeliveryAgent' to renounce this role
  function renounceDeliveryAgent() public {
    _removeDeliveryAgent(msg.sender);

  }

  // Define an internal function '_addDeliveryAgent' to add this role, called by '_ddDeliveryAgent'
  function _addDeliveryAgent(address account) internal {
    deliveryAgents.add(account);
    emit deliveryAgentAdded(account);
  }

  // Define an internal function '_removeDeliveryAgent' to remove this role, called by 'removeDeliveryAgent'
  function _removeDeliveryAgent(address account) internal {
    deliveryAgents.remove(account);
    emit deliveryAgentRemoved(account);
  }
}