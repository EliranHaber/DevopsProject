<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HIT DevOps Project - User Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .nav-links {
            margin-top: 20px;
            text-align: center;
        }
        .nav-links a {
            color: #007bff;
            text-decoration: none;
            margin: 0 15px;
            padding: 8px 16px;
            border: 1px solid #007bff;
            border-radius: 5px;
            display: inline-block;
        }
        .nav-links a:hover {
            background-color: #007bff;
            color: white;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .user-list {
            margin-top: 20px;
        }
        .user-item {
            background-color: #f8f9fa;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            border-left: 4px solid #007bff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>HIT DevOps Project</h1>
        <h2>Users Management System</h2>
        <p><strong>Team:</strong> Eliran Haber, Nimrod Aharon, Saar Shimshi, Nikita Konev, Ido Ronzenfeld</p>
        
        <%
            // Simple session-based user storage for demo purposes
            List<Map<String, String>> users = (List<Map<String, String>>) session.getAttribute("users");
            if (users == null) {
                users = new ArrayList<>();
                session.setAttribute("users", users);
            }
            
            String action = request.getParameter("action");
            String message = "";
            
            if ("register".equals(action)) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                
                if (name != null && !name.trim().isEmpty() && 
                    email != null && !email.trim().isEmpty() && 
                    password != null && !password.trim().isEmpty()) {
                    
                    Map<String, String> user = new HashMap<>();
                    user.put("name", name);
                    user.put("email", email);
                    user.put("password", password);
                    user.put("id", String.valueOf(System.currentTimeMillis()));
                    users.add(user);
                    message = "User registered successfully!";
                } else {
                    message = "Please fill in all fields.";
                }
            }
        %>
        
        <% if (!message.isEmpty()) { %>
            <div class="success"><%= message %></div>
        <% } %>
        
        <form method="post" action="?action=register">
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit">Register User</button>
            <button type="button" onclick="clearForm()">Clear Form</button>
        </form>
        
        <div class="nav-links">
            <a href="?action=view">View All Users</a>
            <a href="?action=stats">Application Stats</a>
            <a href="?action=test">Test Page</a>
        </div>
        
        <%
            if ("view".equals(action)) {
        %>
            <div class="user-list">
                <h3>Registered Users (<%= users.size() %> total)</h3>
                <% if (users.isEmpty()) { %>
                    <p>No users registered yet.</p>
                <% } else { %>
                    <% for (Map<String, String> user : users) { %>
                        <div class="user-item">
                            <strong>Name:</strong> <%= user.get("name") %><br>
                            <strong>Email:</strong> <%= user.get("email") %><br>
                            <strong>ID:</strong> <%= user.get("id") %>
                        </div>
                    <% } %>
                <% } %>
            </div>
        <% } %>
        
        <%
            if ("stats".equals(action)) {
        %>
            <div class="user-list">
                <h3>Application Statistics</h3>
                <div class="user-item">
                    <strong>Total Users:</strong> <%= users.size() %><br>
                    <strong>Server Time:</strong> <%= new java.util.Date() %><br>
                    <strong>Session ID:</strong> <%= session.getId() %><br>
                    <strong>Server Info:</strong> <%= application.getServerInfo() %>
                </div>
            </div>
        <% } %>
        
        <%
            if ("test".equals(action)) {
        %>
            <div class="user-list">
                <h3>Test Page</h3>
                <div class="user-item">
                    <p>This is a test page for monitoring and performance testing.</p>
                    <p>Current timestamp: <%= System.currentTimeMillis() %></p>
                    <p>Random number: <%= (int)(Math.random() * 1000) %></p>
                </div>
            </div>
        <% } %>
    </div>
    
    <script>
        function clearForm() {
            document.getElementById('name').value = '';
            document.getElementById('email').value = '';
            document.getElementById('password').value = '';
        }
        
        // Simple client-side validation
        document.querySelector('form').addEventListener('submit', function(e) {
            var name = document.getElementById('name').value.trim();
            var email = document.getElementById('email').value.trim();
            var password = document.getElementById('password').value.trim();
            
            if (name.length < 2) {
                alert('Name must be at least 2 characters long');
                e.preventDefault();
                return;
            }
            
            if (!email.includes('@')) {
                alert('Please enter a valid email address');
                e.preventDefault();
                return;
            }
            
            if (password.length < 6) {
                alert('Password must be at least 6 characters long');
                e.preventDefault();
                return;
            }
        });
    </script>
</body>
</html>
