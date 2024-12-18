<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Assignment Submission</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 800px;
                margin: 20px auto;
                background-color: #fff;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            form {
                display: flex;
                flex-direction: column;
            }

            label {
                margin-bottom: 8px;
            }

            input,
            textarea {
                margin-bottom: 16px;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            input[type="submit"] {
                background-color: #4caf50;
                color: #fff;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>${ass.getAssignmentName()}</h2>
            <form action="assignmentSubmission" method="post" enctype="multipart/form-data">
                <label for="assignmentFile">Upload Assignment (PDF, DOCX, or TXT):</label>
                <input type="file" name="file" accept=".pdf, .docx, .txt" required>

                <label for="comments">Additional Comments:</label>
                <textarea id="comments" name="comments" rows="4"></textarea>
                <input name="assignment_id" value="${ass.getAssignmentId()}" style="display: none"/>
                <input type="submit" value="Submit Assignment">
                <h3>${is_submited_oke}</h3>
            </form>


        </div>

    </body>
</html>
