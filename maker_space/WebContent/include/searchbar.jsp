<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <form>
               <div class="form-row">
                  <div class="col-12 col-md-2">
                     <div class="dropdown">
                        <button type="button" class="btn btn-primary dropdown-toggle"
                           data-toggle="dropdown">선택사항</button>
                        <div class="dropdown-menu">
                           <a class="dropdown-item" href="#">제목</a> 
                           <a class="dropdown-item" href="#">내용</a> 
                           <a class="dropdown-item" href="#">작성자</a>
                           <a class="dropdown-item" href="#">해시태그</a>
                        </div>
                     </div>
                  </div>

                  <div class="col-12 col-md-8 mb-2 mb-md-0">
                     <input type="text" class="form-control form-control-lg"
                        placeholder="# 5G # 1등 KT ... ">
                  </div>

                  <div class="col-12 col-md-2">
                     <form class="form-inline my-2 my-lg-0">
                        <button type="button" class="btn btn-secondary my-2 my-sm-0"
                           onclick="location.href='search.jsp'">&emsp;검색&emsp;</button>
                     </form>

                  </div>
               </div>
            </form>
    