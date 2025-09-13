# HIT DevOps Project Setup Guide

## Quick Start Checklist

### Phase 1: Environment Setup (Day 1)

#### 1. Install Required Software
- [ ] **Java JDK 8+** - Download from Oracle or OpenJDK
- [ ] **Apache Tomcat 9.x** - Download from Apache website
- [ ] **Git** - Download from git-scm.com
- [ ] **Jenkins** - Download Jenkins WAR file
- [ ] **Selenium IDE** - Browser extension for Firefox/Chrome
- [ ] **Gatling** - Download from gatling.io

#### 2. Tomcat Configuration
```bash
# 1. Extract Tomcat to C:\Program Files\Apache Software Foundation\Tomcat 9.0
# 2. Create folder in webapps directory:
mkdir "C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\eliran-nimrod-saar-nikita-ido"
# 3. Start Tomcat server
# 4. Verify it's running at http://localhost:8080
```

#### 3. Deploy Application
```bash
# Run the deployment script
deploy-to-tomcat.bat
# Or manually copy files to Tomcat webapps folder
```

### Phase 2: Git & GitHub Setup (Day 1-2)

#### 1. Initialize Git Repository
```bash
# Run the setup script
setup-git.bat

# Or manually:
git init
git add .
git commit -m "Initial commit: HIT DevOps Project"
```

#### 2. Create GitHub Repository
1. Go to GitHub.com
2. Create new repository: `hit-devops-project`
3. Add remote origin:
```bash
git remote add origin https://github.com/YOUR_USERNAME/hit-devops-project.git
git push -u origin main
```

### Phase 3: Jenkins Setup (Day 2-3)

#### 1. Install Jenkins
```bash
# Download Jenkins WAR file
# Run: java -jar jenkins.war
# Access: http://localhost:8080
# Install suggested plugins
```

#### 2. Create Jenkins Job
1. New Item → Freestyle project
2. Name: `HIT-DevOps-Deploy`
3. Source Code Management: Git
4. Repository URL: Your GitHub URL
5. Build Triggers: Poll SCM (every minute: `* * * * *`)
6. Build Steps: Execute Windows batch command
7. Command: Use the Jenkinsfile content

#### 3. Test Jenkins Pipeline
1. Make a small change to code
2. Commit and push to GitHub
3. Verify Jenkins job runs automatically
4. Check Tomcat deployment

### Phase 4: Monitoring Setup (Day 3-4)

#### 1. SiteMonitorLite Setup
1. Go to sitemonitorlite.com
2. Create account
3. Add monitor for: `http://localhost:8080/eliran-nimrod-saar-nikita-ido/`
4. Set check interval: 5 minutes
5. Configure Jenkins job to trigger monitoring

#### 2. Alternative: UptimeRobot
1. Go to uptimerobot.com
2. Create account
3. Add HTTP(s) monitor
4. URL: Your application URL
5. Monitoring interval: 5 minutes

### Phase 5: Testing Setup (Day 4-5)

#### 1. Selenium IDE Tests
1. Install Selenium IDE browser extension
2. Open the provided `.side` file
3. Run all three test scenarios:
   - Form Validation Test
   - User Registration Test  
   - Navigation Test
4. Export results and screenshots

#### 2. Gatling Performance Tests
1. Install Gatling
2. Copy the provided Scala test file
3. Run three test scenarios:
   - Max Limit Test (find breaking point)
   - Load Test (5 minutes sustained)
   - Stress Test (3-4 minutes beyond capacity)
4. Export results to PDF

### Phase 6: Public IP Setup (Bonus - Day 5-6)

#### Option 1: Port Forwarding
1. Configure router port forwarding
2. Forward port 8080 to your machine
3. Use your public IP address

#### Option 2: Cloud Instance
1. Create AWS/Google Cloud instance
2. Install Tomcat and deploy application
3. Configure security groups for port 8080

### Phase 7: Documentation & Delivery (Day 6-7)

#### Prepare Deliverables
1. **JSP file**: `index.jsp`
2. **GitHub screenshot**: Repository with code
3. **Tomcat screenshot**: Application running at localhost:8080/...
4. **Monitor tool**: Name, what monitored, screenshot
5. **Selenium file**: `.side` file
6. **Selenium results**: Screenshot with validation explanations
7. **HAR scenario**: Written description of test flow
8. **HAR file**: Generated during testing
9. **Max limit analysis**: Written explanation with screenshots
10. **Gatling results**: 3 screenshots (max, load, stress)
11. **Gatling PDFs**: 3 PDF reports with analysis

## Troubleshooting

### Common Issues
1. **Tomcat won't start**: Check Java installation and port 8080 availability
2. **Jenkins job fails**: Verify Git URL and file paths
3. **Selenium tests fail**: Check application is running and URLs are correct
4. **Gatling tests fail**: Verify application can handle concurrent requests

### File Paths to Update
- Update Tomcat path in `deploy-to-tomcat.bat`
- Update GitHub URL in `Jenkinsfile`
- Update application URL in Gatling and Selenium tests

## Testing Validation Explanations

### Selenium IDE Validations
1. **Form Field Presence**: Ensures all required form elements exist
2. **Success Message**: Verifies user registration works correctly
3. **Navigation Links**: Confirms all page links function properly

### Why These Validations?
- **Functional Testing**: Ensures core application features work
- **User Experience**: Verifies smooth navigation and feedback
- **Data Integrity**: Confirms form submission and data handling

## Performance Testing Strategy

### Max Limit Test
- Gradually increase concurrent users until failure
- Find the breaking point of your application
- Document the maximum sustainable load

### Load Test (5 minutes)
- Sustained load at 70-80% of max capacity
- Verify application stability over time
- Check for memory leaks or performance degradation

### Stress Test (3-4 minutes)
- Load beyond normal capacity (100-120% of max)
- Test application behavior under extreme conditions
- Identify failure modes and recovery mechanisms

## Final Submission Checklist

- [ ] All 11 deliverables prepared
- [ ] Screenshots taken and organized
- [ ] PDF reports generated
- [ ] Email prepared with subject: "Final Exercise from: Eliran Haber, Nimrod Aharon, Saar Shimshi, Nikita Konev, Ido Ronzenfeld"
- [ ] All files attached to email
- [ ] Sent to: mosh.hit@gmail.com
- [ ] Ready for project defense presentation
