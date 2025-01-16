package com.project1.simpleTodoListApp.controller;

import com.project1.simpleTodoListApp.model.Task;
import com.project1.simpleTodoListApp.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
public class TaskController {

    @Autowired
    TaskService service;

    @GetMapping("/tasks")
    public List<Task> getTasks(){
        return service.getTasks();
    }

    @GetMapping("/tasks/{taskId}")
    public Task getTaskById(@PathVariable int taskId) {
        return service.getTaskById(taskId);
    }

    @PostMapping("/tasks")
    public void addTask(@RequestBody Task newTask) {
        System.out.println(newTask);
        service.addTask(newTask);
    }

    @PutMapping("/tasks/{taskId}")
    public void updateTaskById(@PathVariable int taskId, @RequestBody Task task) {
        service.updateTaskById(taskId, task);
    }

    @DeleteMapping("/tasks/{taskId}")
    public void deleteTask(@PathVariable int taskId) {
        service.deleteTask(taskId);
    }
}
