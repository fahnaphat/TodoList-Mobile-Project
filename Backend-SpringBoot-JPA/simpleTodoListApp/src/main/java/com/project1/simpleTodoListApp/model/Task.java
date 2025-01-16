package com.project1.simpleTodoListApp.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import org.springframework.stereotype.Component;

@Component
@Entity
public class Task {
    // this class is use for show all task which called TaskController.

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int _id;
    private String title;
    private String description;
    private Boolean is_completed;

    public Task() {

    }

    public Task(int taskId, String taskName, String detail, Boolean isComplete) {
        this._id = taskId;
        this.title = taskName;
        this.description = detail;
        this.is_completed = isComplete;
    }


    public int get_id() {
        return _id;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public Boolean getIs_completed() {
        return is_completed;
    }

    public void setIs_completed(Boolean is_completed) {
        this.is_completed = is_completed;
    }

    @Override
    public String toString() {
        return "Task{" +
                "_id=" + _id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", is_completed='" + is_completed + '\'' +
                '}';
    }
}
