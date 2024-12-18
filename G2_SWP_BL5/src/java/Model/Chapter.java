/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.List;

/**
 *
 * @author Yen Do
 */
public class Chapter {

    private int chapterId;
    private String chapterName;
    private int chapterOrder;
    private Subject subjectType;
    private String status;
    private List<Lesson> lessons;

    public Chapter() {
    }

    public Chapter(int chapterId, String chapterName, int chapterOrder, Subject subjectType, String status) {
        this.chapterId = chapterId;
        this.chapterName = chapterName;
        this.chapterOrder = chapterOrder;
        this.subjectType = subjectType;
        this.status = status;
    }

    public int getChapterId() {
        return chapterId;
    }

    public void setChapterId(int chapterId) {
        this.chapterId = chapterId;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public Integer getChapterOrder() {
        return chapterOrder;
    }

    public void setChapterOrder(Integer chapterOrder) {
        this.chapterOrder = chapterOrder;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Subject getSubjectType() {
        return subjectType;
    }

    public void setSubjectType(Subject subjectType) {
        this.subjectType = subjectType;
    }

    public List<Lesson> getLessons() {
        return lessons;
    }

    public void setLessons(List<Lesson> lessons) {
        this.lessons = lessons;
    }

    
    @Override
    public String toString() {
        return "Chapter{" + "chapterId=" + chapterId + ", chapterName=" + chapterName + ", chapterOrder=" + chapterOrder + ", status=" + status + ", subjectType=" + subjectType + '}';
    }

}
