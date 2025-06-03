package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

@SpringBootApplication
@RestController
public class GreeterWeb {

    public static void main(String[] args) {
        SpringApplication.run(GreeterWeb.class, args);
    }

    // Root route: HTML form
    @GetMapping("/")
    public String home() {
        return """
                <html>
                    <head><title>Greeter App</title></head>
                    <body>
                        <h2>Welcome to the Greeter App</h2>
                        <form action="/greet" method="get">
                            <label for="name">Enter your name:</label>
                            <input type="text" id="name" name="name" required>
                            <button type="submit">Submit</button>
                        </form>
                    </body>
                </html>
               """;
    }

    // /greet route: Shows the message
    @GetMapping("/greet")
    public String greet(@RequestParam(defaultValue = "Guest") String name) {
        return """
                <html>
                    <head><title>Greeting</title></head>
                    <body>
                        <h2>Hello %s, how may I help you?</h2>
                        <a href="/">Back</a>
                    </body>
                </html>
               """.formatted(name);
    }
}
