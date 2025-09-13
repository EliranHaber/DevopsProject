import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._

class UserManagementSimulation extends Simulation {

  val httpProtocol = http
    .baseUrl("https://devopsproject-vlco.onrender.com")
    .acceptHeader("text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
    .doNotTrackHeader("1")
    .acceptLanguageHeader("en-US,en;q=0.5")
    .acceptEncodingHeader("gzip, deflate")
    .userAgentHeader("Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0")

  val scn = scenario("User Management System Test")
    .exec(http("Load Home Page")
      .get("/")
      .check(status.is(200))
      .check(css("h1").is("HIT DevOps Project")))
    .pause(1)
    .exec(http("View Stats Page")
      .get("/?action=stats")
      .check(status.is(200))
      .check(css("h3").is("Application Statistics")))
    .pause(1)
    .exec(http("View Test Page")
      .get("/?action=test")
      .check(status.is(200))
      .check(css("h3").is("Test Page")))
    .pause(1)
    .exec(http("Register User")
      .post("/?action=register")
      .formParam("name", "Test User ${randomInt()}")
      .formParam("email", "test${randomInt()}@example.com")
      .formParam("password", "password123")
      .check(status.is(200))
      .check(css(".success").exists))
    .pause(2)
    .exec(http("View All Users")
      .get("/?action=view")
      .check(status.is(200))
      .check(css(".user-list").exists))

  // Max Limit Test - Find the breaking point
  setUp(
    scn.inject(
      incrementUsersPerSec(5)
        .times(10)
        .eachLevelLasting(30 seconds)
        .separatedByRampsLasting(10 seconds)
        .startingFrom(5)
    )
  ).protocols(httpProtocol)
   .assertions(
     global.responseTime.max.lt(5000),
     global.successfulRequests.percent.gt(95)
   )

  // Load Test - 5 minutes sustained load
  // setUp(
  //   scn.inject(
  //     constantUsersPerSec(20).during(5 minutes)
  //   )
  // ).protocols(httpProtocol)

  // Stress Test - 3-4 minutes beyond normal capacity
  // setUp(
  //   scn.inject(
  //     rampUsersPerSec(10).to(50).during(2 minutes),
  //     constantUsersPerSec(50).during(2 minutes)
  //   )
  // ).protocols(httpProtocol)
}
