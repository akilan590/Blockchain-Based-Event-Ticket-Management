// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Eventcontract{

    struct even{
        address organizer;
        string name;
        uint date;
        uint price;
        uint ticketcount;
        uint ticketremain;


    }
     mapping (uint => even) public events;
     mapping (address => mapping (uint => uint)) public tickets;
     uint public nextid;

     function createEvent(string memory name,uint date, uint price, uint ticketcount) public   {
        require(date>block.timestamp,"you  can organize next event");
        require(ticketcount>0, "you can organize if had more than one ticket");
        events[nextid]=even(msg.sender,name,date,price,ticketcount,ticketcount);
        nextid++;

     }

     function buyticket(uint id, uint quantity)public  payable {
        require(events[id].date!=0,"event does not exists");
        require(events[id].date>block.timestamp,"event already occurs");
        even storage _even =events[id];
       require(msg.value==(_even.price*quantity),"not enough ether"); 
        require(_even.ticketremain>quantity,"not enough ticket");
        _even.ticketremain -=quantity;
        tickets[msg.sender] [id]+=quantity;


     }
function transferticket(uint id,uint quantity,address to) external  {
    require(events[id].date!=0,"event does not exists");
        require(events[id].date>block.timestamp,"event already occurs");
        require(tickets[msg.sender][id]>=quantity,"you not having enough ticket");
        tickets[msg.sender] [id]-=quantity;
        tickets [to] [id] +=quantity;
}

}