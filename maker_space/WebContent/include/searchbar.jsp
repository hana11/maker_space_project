<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <!-- Search bar -->
         <form>
            <div class="form-row">
               <div class="col-12 col-md-2">
                  <select name="select" class="btn btn-secondary my-2 my-sm-0">
                     <option selected value=0>����
                     <option value=1>����
                     <option value=2>����
                  </select>
               </div>

               <div class="col-12 col-md-8 mb-2 mb-md-0">
                  <input type="text" class="form-control form-control-lg"
                     placeholder="# 5G # 1�� KT ... ">
               </div>
               <div class="col-12 col-md-2">
                  <button type="button" class="btn btn-secondary my-2 my-sm-0"
                     onclick="location.href='search.jsp'">&emsp;�˻�&emsp;</button>
               </div>
            </div>
         </form>
        

         <!-- /.Search -->