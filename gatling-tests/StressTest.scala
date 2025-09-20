import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._

class StressTest extends Simulation {

  val httpProtocol = http
    .baseUrl("https://devopsproject-1-6y4f.onrender.com")
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

  // Bounce Stress Test - 110% → 90% → 110% pattern
  // This tests system recovery under repeated stress
  setUp(
    scn.inject(
      // Phase 1: Ramp to 110% capacity (55 users/sec)
      rampUsersPerSec(10).to(55).during(1 minute),
      // Phase 2: Sustain 110% capacity
      constantUsersPerSec(55).during(1 minute),
      // Phase 3: Drop to 90% capacity (45 users/sec) for recovery
      rampUsersPerSec(55).to(45).during(30 seconds),
      constantUsersPerSec(45).during(1 minute),
      // Phase 4: Bounce back to 110% capacity
      rampUsersPerSec(45).to(55).during(30 seconds),
      constantUsersPerSec(55).during(1 minute)
    )
  ).protocols(httpProtocol)
   .assertions(
     global.responseTime.max.lt(8000), // More lenient for stress test
     global.successfulRequests.percent.gt(90) // More lenient for stress test
   )
}
