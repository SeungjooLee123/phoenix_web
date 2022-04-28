package com.phoenix.bss;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class IotController {
   String picture = "";
   Gson gson = new Gson();
   String base_code ="";
   String test_shake = ""; 
        
        
   
   @ResponseBody
   @RequestMapping("/iot_cap.io")
   public void and_cap(String code) {
      picture = code;
   }
   
   @ResponseBody
   @RequestMapping("/ras_cap.io")
   public String ras_cap() {
      return gson.toJson(picture);
   }
   
   @ResponseBody
   @RequestMapping("/ras_cap_ok.io")
   public void ras_cap_ok() {
      picture = "";
   }
   @ResponseBody
   @RequestMapping("/img_to_base")
   public void img_to_base(String base) {
      System.out.println("라즈 접근");
      System.out.println(base);
      base_code = base;
   } 
   
   @ResponseBody
   @RequestMapping("/base_to_img.io")
   public String base_to_img() {
      return gson.toJson(base_code);
   }
   
   //안드에서 받는 역할 
   @ResponseBody
   @RequestMapping("/biking.io")
   public void shake_biking(String biking) {
      test_shake = biking;   
   }
   
   
   @ResponseBody
   @RequestMapping("/shake.io")
   public String biking_jyp() {
      
      return gson.toJson(test_shake);
            
   }
   
   @ResponseBody
   @RequestMapping("/stop_biking.io")
   public void stop_moter() {
      test_shake = "";
   }
   
}