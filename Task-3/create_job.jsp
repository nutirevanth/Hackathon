<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enter Job Data</title>
<title>Enter Job Data</title>
<link rel="stylesheet" href="styles.css">
<script>
        function validateJobForm() {
            const title = document.getElementById('title').value.trim();
            const type = document.getElementById('type').value;
            const department = document.getElementById('department').value;
            const country = document.getElementById('country').value;
            const description = document.getElementById('description').value.trim();
            const openingDate = document.getElementById('openingDate').value;

            if (!title || !type || !department || !country || !description || !openingDate) {
                alert("Please fill in all required fields.");
                return false;
            }

            const currentDate = new Date().toISOString().split('T')[0];
            if (openingDate > currentDate) {
                alert("Opening date cannot be in the future.");
                return false;
            }

            return true;
        }
</script>
</head>
<body>
    <h1>Enter Job Data</h1>
    <form onsubmit="return validateJobForm()" action="submitJob" method="post">
        <label for="title">Title: *</label>
        <input type="text" id="title" name="title" required><br><br>

        <label for="type">Type: *</label>
        <select id="type" name="type" required>
            <option value="">Select type</option>
            <!-- Add options here -->
        </select><br><br>

        <label for="department">Department: *</label>
        <select id="department" name="department" required>
            <option value="">Select department</option>
            <!-- Add options here -->
        </select><br><br>

        <label for="country">Country: *</label>
        <select id="country" name="country" required>
            <option value="">Select country</option>
            <!-- Add options here -->
        </select><br><br>

        <label for="description">Description: *</label>
        <textarea id="description" name="description" required></textarea><br><br>

        <label for="openingDate">Opening Date: *</label>
        <input type="date" id="openingDate" name="openingDate" required><br><br>

        <button type="submit">Submit</button>
    </form>
</body>
</html>