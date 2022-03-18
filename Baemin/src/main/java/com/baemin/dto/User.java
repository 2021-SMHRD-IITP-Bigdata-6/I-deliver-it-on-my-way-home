package com.baemin.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class User {
   private String mem_id;
   private String mem_pw;
   private String mem_name;
   private String role;
   
   public String getMem_id() {
      return mem_id;
   }


   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }


   public String getMem_pw() {
      return mem_pw;
   }


   public void setMem_pw(String mem_pw) {
      this.mem_pw = mem_pw;
   }


   public String getMem_name() {
      return mem_name;
   }


   public void setMem_name(String mem_name) {
      this.mem_name = mem_name;
   }



   public String getRole() {
      return role;
   }


   public void setRole(String role) {
      this.role = role;
   }


   @Override
   public String toString() {
      return "User [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", role=" + role + "]";
   }
   

   
}