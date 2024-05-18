<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply for Jobs</title>
 <link rel="stylesheet" href="styles.css">
    <script>
        function validateApplyForm() {
            const fields = [
                'firstName', 'lastName', 'email', 'phone',
                'address', 'city', 'state', 'zip', 'country',
                'educationLevel', 'resume'
            ];
            for (let field of fields) {
                if (!document.getElementById(field).value.trim()) {
                    alert("Please fill in all required fields.");
                    return false;
                }
            }

            const zip = document.getElementById('zip').value;
            if (isNaN(zip) || zip <= 0) {
                alert("Please enter a valid ZIP code.");
                return false;
            }

            const phone = document.getElementById('phone').value;
            const phonePattern = /^[0-9]{10}$/;
            if (!phonePattern.test(phone)) {
                alert("Please enter a valid 10-digit phone number.");
                return false;
            }

            const email = document.getElementById('email').value;
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return false;
            }

            const employed = document.getElementById('employed').checked;
            if (employed) {
                const employer = document.getElementById('employer').value.trim();
                const experience = document.getElementById('experience').value;
                if (!employer || isNaN(experience) || experience < 0) {
                    alert("Please provide valid employment details.");
                    return false;
                }
            }

            return true;
        }

        function toggleEmploymentDetails() {
            const employed = document.getElementById('employed').checked;
            document.getElementById('employmentDetails').style.display = employed ? 'block' : 'none';
        }
    </script>
</head>

<body>
<h1>Apply for Jobs</h1>
    <form onsubmit="return validateApplyForm()" action="submitApplication" method="post" enctype="multipart/form-data">
        <label for="firstName">First Name: *</label>
        <input type="text" id="firstName" name="firstName" required><br><br>

        <label for="lastName">Last Name: *</label>
        <input type="text" id="lastName" name="lastName" required><br><br>

        <label for="email">Email: *</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="phone">Phone: *</label>
        <input type="text" id="phone" name="phone" required><br><br>

        <label for="address">Address: *</label>
        <input type="text" id="address" name="address" required><br><br>

        <label for="city">City: *</label>
        <input type="text" id="city" name="city" required><br><br>

        <label for="state">State: *</label>
        <input type="text" id="state" name="state" required><br><br>

        <label for="zip">ZIP: *</label>
        <input type="text" id="zip" name="zip" required><br><br>

        <label for="country">Country: *</label>
        <select id="country" name="country" required>
            <option value="">Select country</option>
            <!-- Add options here -->
        </select><br><br>

        <label for="educationLevel">Education Level: *</label>
        <select id="educationLevel" name="educationLevel" required>
            <option value="">Select education level</option>
            <!-- Add options here -->
        </select><br><br>

        <label for="resume">Resume: *</label>
        <input type="file" id="resume" name="resume" required><br><br>

        <label for="coverLetter">Cover Letter:</label>
        <textarea id="coverLetter" name="coverLetter"></textarea><br><br>

        <label for="employed">Are you employed?</label>
        <input type="checkbox" id="employed" name="employed" onchange="toggleEmploymentDetails()"><br><br>

        <div id="employmentDetails" style="display:none;">
            <label for="employer">Current Employer:</label>
            <input type="text" id="employer" name="employer"><br><br>

            <label for="experience">Years of Experience:</label>
            <input type="number" id="experience" name="experience" min="0"><br><br>
        </div>

        <label for="jobList">Jobs you want to apply:</label>
        <select id="jobList" name="jobList" multiple>
            <!-- Add options here -->
        </select><br><br>

        <button type="submit">Submit</button>
    </form>

</body>
</html>