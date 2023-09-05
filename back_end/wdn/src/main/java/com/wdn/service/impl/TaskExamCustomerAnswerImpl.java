package com.wdn.service.impl;

import com.wdn.domain.ExamPaper;
import com.wdn.domain.ExamPaperAnswer;
import com.wdn.domain.TaskExamCustomerAnswer;
import com.wdn.domain.TextContent;
import com.wdn.domain.task.TaskItemAnswerObject;
import com.wdn.repository.TaskExamCustomerAnswerMapper;
import com.wdn.service.TaskExamCustomerAnswerService;
import com.wdn.service.TextContentService;
import com.wdn.utility.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Service
public class TaskExamCustomerAnswerImpl extends BaseServiceImpl<TaskExamCustomerAnswer> implements TaskExamCustomerAnswerService {

    private final TaskExamCustomerAnswerMapper taskExamCustomerAnswerMapper;
    private final TextContentService textContentService;

    @Autowired
    public TaskExamCustomerAnswerImpl(TaskExamCustomerAnswerMapper taskExamCustomerAnswerMapper, TextContentService textContentService) {
        super(taskExamCustomerAnswerMapper);
        this.taskExamCustomerAnswerMapper = taskExamCustomerAnswerMapper;
        this.textContentService = textContentService;
    }

    @Override
    public void insertOrUpdate(ExamPaper examPaper, ExamPaperAnswer examPaperAnswer, Date now) {
        Integer taskId = examPaper.getTaskExamId();
        Integer userId = examPaperAnswer.getCreateUser();
        TaskExamCustomerAnswer taskExamCustomerAnswer = taskExamCustomerAnswerMapper.getByTUid(taskId, userId);
        if (null == taskExamCustomerAnswer) {
            taskExamCustomerAnswer = new TaskExamCustomerAnswer();
            taskExamCustomerAnswer.setCreateTime(now);
            taskExamCustomerAnswer.setCreateUser(userId);
            taskExamCustomerAnswer.setTaskExamId(taskId);
            List<TaskItemAnswerObject> taskItemAnswerObjects = Arrays.asList(new TaskItemAnswerObject(examPaperAnswer.getExamPaperId(), examPaperAnswer.getId(), examPaperAnswer.getStatus()));
            TextContent textContent = textContentService.jsonConvertInsert(taskItemAnswerObjects, now, null);
            textContentService.insertByFilter(textContent);
            taskExamCustomerAnswer.setTextContentId(textContent.getId());
            insertByFilter(taskExamCustomerAnswer);
        } else {
            TextContent textContent = textContentService.selectById(taskExamCustomerAnswer.getTextContentId());
            List<TaskItemAnswerObject> taskItemAnswerObjects = JsonUtil.toJsonListObject(textContent.getContent(), TaskItemAnswerObject.class);
            taskItemAnswerObjects.add(new TaskItemAnswerObject(examPaperAnswer.getExamPaperId(), examPaperAnswer.getId(), examPaperAnswer.getStatus()));
            textContentService.jsonConvertUpdate(textContent, taskItemAnswerObjects, null);
            textContentService.updateByIdFilter(textContent);
        }
    }

    @Override
    public TaskExamCustomerAnswer selectByTUid(Integer tid, Integer uid) {
        return taskExamCustomerAnswerMapper.getByTUid(tid, uid);
    }

    @Override
    public List<TaskExamCustomerAnswer> selectByTUid(List<Integer> taskIds, Integer uid) {
        return taskExamCustomerAnswerMapper.selectByTUid(taskIds, uid);
    }
}
