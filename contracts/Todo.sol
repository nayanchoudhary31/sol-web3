//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract Todo {
    struct TodoList {
        string text;
        bool isCompleted;
    }

    TodoList[] public todolist;

    function addTodo(string calldata _text) external {
        todolist.push(TodoList({text: _text, isCompleted: false}));
    }

    function updateTodo(uint256 _index, string calldata _text) external {
        todolist[_index].text = _text; // One Way
        // Gas Cost More 3879 as we accessing array four time
        // todolist[_index].text = _text;
        // todolist[_index].text = _text;
        // todolist[_index].text = _text;
        // todolist[_index].text = _text;

        // Gas Cost Less 3785
        // As we access array only once
        // TodoList storage t1 = todolist[_index]; // Another Way
        // t1.text = _text;
        // t1.text = _text;
        // t1.text = _text;
        // t1.text = _text;

        // Use storage pattern if want to set multiple value
        // Use Index Patttern if want to set only single value
    }

    function getTodo(uint256 _index)
        external
        view
        returns (string memory, bool)
    {
        // TodoList storage t1 = todolist[_index]; // 33917
        TodoList memory t1 = todolist[_index]; // 37137
        return (t1.text, t1.isCompleted);
    }

    function toggleCompleteTodo(uint256 _index) external {
        todolist[_index].isCompleted = !todolist[_index].isCompleted; // if true => false if false => true
    }
}
