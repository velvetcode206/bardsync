package com.bardsync.service_auth;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthController {

    @GetMapping("/")
    public String getHealthStatus() {
        return "Service Healthy";
    }
}
