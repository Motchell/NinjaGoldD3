package com.codingdojo.dojosurvey.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
@Controller
public class NinjaController {
	
    @GetMapping("/")
    public String game(HttpSession session) {
    	if (session.getAttribute("gold") == null 
    		&& session.getAttribute("titulo") == null
    		&& session.getAttribute("activities") == null
    		) {
    		session.setAttribute("activities", new ArrayList<String>());
            session.setAttribute("gold", 0);
            session.setAttribute("titulo", "¡Ninja Game!");
        }
        return "index.jsp";  
    }

    @SuppressWarnings("unchecked")
	@PostMapping("/play")
    public String play(@RequestParam String place, HttpSession session) {
    	List<String> activities = (List<String>) session.getAttribute("activities");
        int gold = (int) session.getAttribute("gold");
        int goldChange = calculateGoldChange(place);
        session.setAttribute("titulo", "Ninja Game: " + place);
        session.setAttribute("gold", gold + goldChange);
        
        String activity = generateActivityLog(goldChange, place);
        activities.add(activity);
        session.setAttribute("activities", activities);
        
        return "redirect:/";
    }

    private int calculateGoldChange(String place) {
        switch (place) {
            case "farm":
                return (int) (Math.random() * 11 + 10);
            case "cave":
                return (int) (Math.random() * 6 + 5);
            case "house":
                return (int) (Math.random() * 4 + 2);
            case "casino":
                return (int) (Math.random() * 101) - 50;
            default:
                return 0;
        }
    }
    
    private String generateActivityLog(int goldChange, String place) {
        String activityMessage = (goldChange >= 0) ?
            "Has ganado " + goldChange + " de oro en " + place + "! :)" :
            "Has perdido " + Math.abs(goldChange) + " de oro en " + place + ". :(";
        return activityMessage;
    }
}

