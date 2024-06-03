// SPDX-Licence-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract todo {
    enum TaskStatus {Pending, Finished}
    address owner; 
    struct Task {
        string desc;
        TaskStatus status;
    }
    Task[] public tasks;
    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function addTheTask(string memory _desc) public onlyOwner {
        tasks.push(Task(_desc, TaskStatus.Pending));
    }
    
    function markFinished(uint256 id) public onlyOwner {
        require(id < tasks.length, "No task has been mentioned");
        tasks[id].status = TaskStatus.Finished;
    }

    function TaskCount() public view returns (uint256) {
        return tasks.length;
    }

    function AllTasks() public view returns (Task [] memory){
        return tasks;
    }


    function getTask(uint256 id) public view returns (string memory, TaskStatus) {
        require(id < tasks.length, "No task has been mentioned");
        return(tasks[id].desc, tasks[id].status);
    }
}
