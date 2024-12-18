<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Course - Blog</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Course Project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
    <link href="plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="styles/news_styles.css">
    <link rel="stylesheet" type="text/css" href="styles/news_responsive.css">
</head>
<body>

<!-- News -->
<div class="news">
    <div class="container">
        <div class="row">
            <!-- News Column -->
            <div class="col-lg-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">Create a New Blog</h2>
                        <form>
                            <div class="form-group">
                                <label for="blogCategory">Category</label>
                                <input type="text" class="form-control" id="blogCategory" placeholder="Enter blog category">
                            </div>
                            <div class="form-group">
                                <label for="blogDescription">Description</label>
                                <textarea class="form-control" id="blogDescription" rows="3" placeholder="Enter blog description"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="blogImage">Image URL</label>
                                <input type="text" class="form-control" id="blogImage" placeholder="Enter image URL">
                            </div>
                            <div class="form-group">
                                <label for="blogTitle">Title</label>
                                <input type="text" class="form-control" id="blogTitle" placeholder="Enter blog title">
                            </div>
                            <div class="form-group">
                                <label for="blogContent">Content</label>
                                <textarea class="form-control" id="blogContent" rows="10" placeholder="Enter blog content"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Create Blog</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- CKEditor Script -->
<script src="https://cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script>
<script>
    // Activate CKEditor on blogContent textarea
    CKEDITOR.replace('blogContent');
</script>

<!-- Bootstrap and other scripts -->
<script src="path_to_your_bootstrap/jquery.min.js"></script>
<script src="path_to_your_bootstrap/bootstrap.min.js"></script>
</body>
</html>
