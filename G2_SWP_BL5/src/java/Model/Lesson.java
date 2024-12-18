/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Yen Do
 */
public class Lesson {

    private int lessonId;
    private String lessonName;
    private String lessonVideo;
    private Chapter chapterType;
    private String status;

    public Lesson() {
    }

    public Lesson(int lessonId, String lessonName, String lessonVideo, Chapter chapterType, String status) {
        this.lessonId = lessonId;
        this.lessonName = lessonName;
        this.lessonVideo = lessonVideo;
        this.chapterType = chapterType;
        this.status = status;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public String getLessonVideo() {
        return lessonVideo;
    }

    public void setLessonVideo(String lessonVideo) {
        this.lessonVideo = lessonVideo;
    }

    public Chapter getChapterType() {
        return chapterType;
    }

    public void setChapterType(Chapter chapterType) {
        this.chapterType = chapterType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Lesson{" + "lessonId=" + lessonId + ", lessonName=" + lessonName + ", lessonVideo=" + lessonVideo + ", chapterType=" + chapterType + ", status=" + status + '}';
    }

}
