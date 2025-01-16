package com.project1.simpleTodoListApp.service;

import com.project1.simpleTodoListApp.model.Task;
import com.project1.simpleTodoListApp.repository.TaskRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService {

    @Autowired
    TaskRepo repo;

    // method for get all task
    public List<Task> getTasks() {
        return repo.findAll();
    }

    // method for get task by id
    public Task getTaskById(int taskId) {
        return repo.findById(taskId).orElse(new Task());
    }

    // method for create new task
    public void addTask(Task newTask) {
        repo.save(newTask);
    }

    public void deleteTask(int taskId) {
        //if(index == 0) return "Task can't delete: not found task."
        repo.deleteById(taskId);
    }

    public void updateTaskById(int taskId, Task updatedTask) {
        Task existingTask = repo.findById(taskId).orElse(null);
        if (existingTask != null) {
            existingTask.setTitle(updatedTask.getTitle());
            existingTask.setDescription(updatedTask.getDescription());
            existingTask.setIs_completed(updatedTask.getIs_completed());
            repo.save(existingTask);
        }
    }

}
