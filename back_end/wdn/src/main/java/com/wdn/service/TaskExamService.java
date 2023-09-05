package com.wdn.service;

import com.wdn.domain.TaskExam;
import com.wdn.domain.User;
import com.wdn.viewmodel.admin.task.TaskPageRequestVM;
import com.wdn.viewmodel.admin.task.TaskRequestVM;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface TaskExamService extends BaseService<TaskExam> {

    PageInfo<TaskExam> page(TaskPageRequestVM requestVM);

    void edit(TaskRequestVM model, User user);

    TaskRequestVM taskExamToVM(Integer id);

    List<TaskExam> getByGradeLevel(Integer gradeLevel);
}
