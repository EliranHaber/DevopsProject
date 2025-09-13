# HIT DevOps Final Project

## Team Members
- Eliran Haber
- Nimrod Aharon  
- Saar Shimshi
- Nikita Konev
- Ido Ronzenfeld

## Project Overview
User Management System built with JSP demonstrating a complete DevOps pipeline from development to production.

## Live Application
**Live Demo:** [https://devopsproject-1-6y4f.onrender.com](https://devopsproject-1-6y4f.onrender.com)

## Features
- User registration with validation
- Session-based data storage
- Application statistics
- Performance monitoring

## Tech Stack
- **Backend:** JSP, Java 8
- **Server:** Apache Tomcat 8.5
- **Deployment:** Docker, Render
- **CI/CD:** Jenkins
- **Testing:** Selenium IDE, Gatling
- **Monitoring:** UptimeRobot

## Project Structure
```
├── index.jsp                    # Main application
├── Dockerfile                   # Container configuration
├── gatling-tests/              # Performance tests
├── selenium-tests/             # Functional tests
└── WEB-INF/                    # Web configuration
```

## Testing
- **Functional:** Selenium IDE (Form validation, User registration, Navigation)
- **Performance:** Gatling (Max limit, Load test, Stress test)
- **Monitoring:** Automated availability checks every 5 minutes

## DevOps Pipeline
1. **Development:** Local Tomcat deployment
2. **Version Control:** GitHub repository
3. **CI/CD:** Jenkins automation
4. **Deployment:** Docker container on Render
5. **Monitoring:** UptimeRobot + Jenkins triggers
