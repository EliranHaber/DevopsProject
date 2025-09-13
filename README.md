# HIT DevOps Final Project

## Team Members
- Eliran Haber
- Nimrod Aharon  
- Saar Shimshi
- Nikita Konev
- Ido Ronzenfeld

## Project Overview
This is a User Management System built with JSP for the HIT DevOps course final project. The application demonstrates a complete CI/CD pipeline from development to production.

## Application Features
- User registration form with validation
- User data storage (session-based)
- Navigation links for different views
- Application statistics page
- Test page for monitoring and performance testing

## Project Structure
```
hit-devops-project/
├── index.jsp              # Main application file
├── WEB-INF/
│   └── web.xml           # Web application configuration
└── README.md             # This file
```

## Deployment Instructions

### 1. Tomcat Setup
1. Download and install Apache Tomcat
2. Create folder in `webapps` directory: `eliran-nimrod-saar-nikita-ido`
3. Copy all project files to the new folder

### 2. Git Setup
1. Initialize Git repository: `git init`
2. Add files: `git add .`
3. Commit: `git commit -m "Initial commit"`
4. Create GitHub repository
5. Push to GitHub: `git push origin main`

### 3. Jenkins Configuration
- Create new job to pull from GitHub
- Configure deployment to Tomcat webapps folder
- Set up automated deployment pipeline

## Testing Scenarios

### Selenium IDE Tests
1. **Form Validation Test**: Verify all form fields are required
2. **User Registration Test**: Submit valid user data and verify success message
3. **Navigation Test**: Test all navigation links work correctly

### Gatling Performance Tests
1. **Max Limit Test**: Find application's maximum concurrent users
2. **Load Test**: 5-minute sustained load test
3. **Stress Test**: 3-4 minute stress test beyond normal capacity

## Monitoring
- Application availability monitoring every 5 minutes
- Performance metrics collection
- Error rate monitoring

## Deliverables
1. JSP application file
2. GitHub repository screenshots
3. Tomcat deployment screenshots
4. Monitoring tool configuration and results
5. Selenium IDE test files and results
6. Gatling performance test results and analysis
7. Complete documentation and analysis

## Technical Requirements
- Java 8 or higher
- Apache Tomcat 9.x or higher
- Modern web browser for testing
- Jenkins for CI/CD pipeline
- Selenium IDE for functional testing
- Gatling for performance testing
