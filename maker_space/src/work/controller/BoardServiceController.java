/**
 * <pre>
 * @author DONGHYUNLEE HANAJUNG YOUNGHWANGBO
 * @version ver.1.0
 * @since jdk1.8
 * </pre>
 */
package work.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work.model.dto.IdeaBoard;
import work.model.dto.Member;
import work.model.dto.TipIdeaBoard;
import work.model.service.BoardService;
import work.model.service.MemberService;
import work.util.MyUtility;

/**
 * Servlet Controller - BoardServiceController
 */
public class BoardServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService;
    /**
     * 기본 생성자
     */
    public BoardServiceController() {
    	boardService = BoardService.getInstance();
    }
    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			System.out.println("Controller proccess action: " + action);
			switch(action) {
			case "write":
				write(request, response);
				break;
			case "delete":
				delete(request, response);
				break;
			case "findName":
				//findName(request, response);
				break;
			case "findTitle":
				findTitle(request, response);
				break;
			case "findContent":
				//findContent(request, response);
				break;
			case "findHashTag":
				//findHashTag(request, response);
				break;
			case "getBoards":
				getBoards(request, response);
				break;
			case "getBoard":
				getBoard(request, response);
				break;
			case "select" :
				select(request,response);
				break;
			case "getTipBoards" :
				getTipBoards(request,response);
				break;
			default:
				System.out.println("\n## 서비스 준비중입니다. 제공되지 않는 서비스입니다.");
				break;
		}	
		} catch(NullPointerException e){
			e.printStackTrace();
		} finally {
			
		}
	}
    /**
     * 글 채택 서블렛
     * 
     * @param request
     * @param response
     */
 	
	private void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## 글 채택 요청 서비스");
		
		if (!isLoginMember(request, response)) {
			System.out.println("로그인 해주세요");
			PrintWriter out = response.getWriter();
			response.resetBuffer();
			response.setContentType("text/html;charset=euc-kr");
			out.println("<script language='javascript'>");
			out.print("alert(\"");
			out.print("회원 가입 서비스입니다. 회원가입 후 이용해주세요.");
			out.println("\");");
			out.println("history.go(-1)");
			out.println("</script>");
			response.flushBuffer();
			return ;
		}
		
		String category = request.getParameter("category");
		System.out.println("businessIndex : "+request.getParameter("businessBoardsIdx"));
		int boardIdx = Integer.parseInt(request.getParameter("businessBoardsIdx"));
		
		System.out.println(" 채택 서비스  컨트롤러 :: boardIdx : " + boardIdx);
		
		if (boardIdx == 0) {
			System.out.println("보드인덱스  0");
			return;
		}
		
		int isResult = boardService.registerMySelect(category,boardIdx);
		if (isResult != 0) {
			System.out.println("글 채택 성공");
			//request.getRequestDispatcher("myProcess.jsp").forward(request, response);
			PrintWriter out = response.getWriter();
		      response.resetBuffer();
		      response.setContentType("text/html;charset=euc-kr");
		      out.println("<script language='javascript'>");
		      out.print("alert(\"");
		      out.print("채택 되었습니다.");
		      out.println("\");");
		      out.println("history.go(-1)");
		      out.println("</script>");
		      response.flushBuffer();
			
		} else {
			System.out.println("글 채택 실패");
			request.setAttribute("message", "이미 가입된 회원입니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/**
     * 글쓰기 서블렛
     */
    protected void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## 글쓰기 요청 서비스");
		HttpSession session = request.getSession(false);
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String result = request.getParameter("result");
		String files = request.getParameter("files");
		String[] hashTag = request.getParameterValues("hashTag");
		String email = (String)session.getAttribute("email");
		int businessBoardsIdx, tipBoardIdx;
		if(errorGenerate(request, response, title, "제목을 입력해주세요!") != true ) {
			return;
		}
		if(errorGenerate(request, response, content, "비밀번호를 입력해주세요!") != true) {
			return;
		}
		if(errorGenerate(request, response, result, "아이디를 입력해주세요!") != true) {
			return;
		}
		 if (errorGenerate(request, response, title, "제목을 입력해주세요!") != true) {
	         return;
	      }
	      if (errorGenerate(request, response, content, "비밀번호를 입력해주세요!") != true) {
	         return;
	      }
	      if (errorGenerate(request, response, result, "아이디를 입력해주세요!") != true) {
	         return;
	      }
	      if (category.equals("it")) {
	         businessBoardsIdx = boardService.businessWrite("it", new IdeaBoard(title, content, result, files, 0, email,
	               MyUtility.dateGenerator(), (String) session.getAttribute("name")));
	         if (businessBoardsIdx != 0) {
	            System.out.println("BoardService it boards 글쓰기 성공");
	            boardService.businssRegisterHashTag(businessBoardsIdx, hashTag);
	            getBoards(request, response);
	         } else {
	            System.out.println("BoardService it boards 글쓰기 실패");
	            request.setAttribute("message", "글 쓰기에 오류가 생겼습니다!");
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	         }
	      } else if (category.equals("market")) {
	         businessBoardsIdx = boardService.businessWrite("market", new IdeaBoard(title, content, result, files, 0,
	               email, MyUtility.dateGenerator(), (String) session.getAttribute("name")));
	         if (businessBoardsIdx != 0) {
	            System.out.println("BoardService market boards 글쓰기 성공");
	            boardService.businssRegisterHashTag(businessBoardsIdx, hashTag);
	            getBoards(request, response);
	         } else {
	            System.out.println("BoardService market boards 글쓰기 실패");
	            request.setAttribute("message", "글 쓰기에 오류가 생겼습니다!");
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	         }
	      } else if (category.equals("media")) {
	         businessBoardsIdx = boardService.businessWrite("media", new IdeaBoard(title, content, result, files, 0,
	               email, MyUtility.dateGenerator(), (String) session.getAttribute("name")));
	         if (businessBoardsIdx != 0) {
	            System.out.println("BoardService media boards 글쓰기 성공");
	            boardService.businssRegisterHashTag(businessBoardsIdx, hashTag);
	            getBoards(request, response);
	         } else {
	            System.out.println("BoardService it boards 글쓰기 실패");
	            request.setAttribute("message", "글 쓰기에 오류가 생겼습니다!");
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	         }
	      } else if (category.equals("etc")) {
	         businessBoardsIdx = boardService.businessWrite("etc", new IdeaBoard(title, content, result, files, 0, email,
	               MyUtility.dateGenerator(), (String) session.getAttribute("name")));
	         if (businessBoardsIdx != 0) {
	            System.out.println("BoardService etc boards 글쓰기 성공");
	            boardService.businssRegisterHashTag(businessBoardsIdx, hashTag);
	            getBoards(request, response);
	         }
	
		} /*else if (category.equals("tips")) {
			System.out.println("보드컨트롤러 진입성공");
			tipBoardIdx = boardService.tipWrite(category, new TipIdeaBoard(title, content, result, files, 0,
			email, MyUtility.dateGenerator(),  0, (String) session.getAttribute("name")));
			System.out.println("컨트롤러 TIP IDX :: " +tipBoardIdx);
			boardService.myTipWrite(category, tipBoardIdx);
			
			if (tipBoardIdx != 0) {
				System.out.println("tipBoards 글쓰기 성공");
				boardService.businssRegisterHashTag(tipBoardIdx, hashTag);
				
			} else {
				System.out.println("tipBoards 글쓰기 실패");
				request.setAttribute("message", "글 쓰기에 오류가 생겼습니다!");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}*/
		
	}
    
    /**
     * 제목 글검색 서블렛
     */
    protected void findTitle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## 제목글검색 요청 서비스");
		String title = request.getParameter("title");
		
		System.out.println("title: " + title +"//");
		
		if(errorGenerate(request, response, title, "검색어를 입력해주세요!") != true ) {
			return;
		}
		
		ArrayList<IdeaBoard> ideaBoards = boardService.businessFindByTitle(title);
		if(ideaBoards != null) {
			System.out.println("글검색 성공");
			request.setAttribute("ideaBoards", ideaBoards);
			request.getRequestDispatcher("search.jsp").forward(request, response);
		} else {
			System.out.println("글검색 없음");
			request.setAttribute("message", "해당되는 검색이 없습니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
    /**
     * 글삭제 서블렛
     */
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## 글삭제 요청 서비스");
		HttpSession session = request.getSession(false);
		String email;
		if (session != null) {
			email = (String) session.getAttribute("email");
		} else {
			email = null;
		}
		int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
		if(boardIdx == 0) {
			System.out.println("보드인덱스  0");
			return;
		}
		if(email == null) {
			System.out.println("email null");
			return;
		}
		int isResult = boardService.businessDelete(boardIdx);
		if(isResult != 0) {
			System.out.println("글삭제 성공");
			request.getRequestDispatcher("mainService.jsp").forward(request, response);
		} else {
			System.out.println("글삭제 실패");
			request.setAttribute("message", "이미 가입된 회원입니다.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
    /**
     * 각각의 Boards 가져오기
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void getBoards(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## getBoards 요청 서비스");
		String category = request.getParameter("category");
		HttpSession session = request.getSession(false);
		String email = session.getAttribute("email").toString();
		int page = 1;
		if (request.getParameter("page") != null && request.getParameter("page").trim().equals("") == false) {
			page = Integer.parseInt(request.getParameter("page"));
			System.out.println(">>>" + page);
		}	
		if(category == null) {
			System.out.println("category is Null");
			return;
		}

		Map<String, Object> map = boardService.getBoards(page, category, email);
		map.put("sessionName", session.getAttribute("name"));
		request.setAttribute("category", category);
		request.setAttribute("map", map);
		if(category.equals("it")||category.equals("market")||category.equals("media")||category.equals("etc")) {
			request.getRequestDispatcher("businessBoard.jsp").forward(request, response);
		}
		if(category.equals("myIdea") ) {
			request.getRequestDispatcher("myIdea.jsp").forward(request, response);;
		} else if(category.equals("select")) {
			request.getRequestDispatcher("myProcess.jsp").forward(request, response);
		} else if(category.equals("tips")) {
			request.getRequestDispatcher("coolTips.jsp").forward(request, response);
		}
		return;
	}
    protected void getTipBoards(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## Board controller :: getTipBoards 요청 서비스");
		HttpSession session = request.getSession(false);
		String email = session.getAttribute("email").toString();
		String category = request.getParameter("category");
		int page = 1;
		if (request.getParameter("page") != null && request.getParameter("page").trim().equals("") == false) {
			page = Integer.parseInt(request.getParameter("page"));
			System.out.println(">>>" + page);
		}	
		
		Map<String, Object> map = boardService.getTipBoards(page, category, email);
		map.put("sessionName", session.getAttribute("name"));
		request.setAttribute("map2", map);
		
		if(category.equals("myTips")) {
			request.getRequestDispatcher("myTips.jsp").forward(request, response);
		}
		
		else if(category.equals("tips")) {
			request.getRequestDispatcher("coolTips.jsp").forward(request, response);
		}
		return;
	}
    
    /**
     * 각각의 Boards 가져오기
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected int getBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	String category = request.getParameter("category");
    	System.out.println(">> :" +request.getParameter("businessBoardsIdx"));
    	int businessBoardsIdx = Integer.parseInt(request.getParameter("businessBoardsIdx"));	
    
    	System.out.println("businessBoardsIdx :: "+businessBoardsIdx);
		IdeaBoard ideaBoard = boardService.getBoard(businessBoardsIdx);
		if (ideaBoard != null) {
			request.setAttribute("businessIdx", ideaBoard.getIndex());
			request.setAttribute("businessBoardsIdx", businessBoardsIdx);
			request.setAttribute("title", ideaBoard.getTitle());
			request.setAttribute("content", ideaBoard.getTitle());
			request.setAttribute("result", ideaBoard.getResult());
			request.setAttribute("files", ideaBoard.getFiles());
			request.setAttribute("hits", ideaBoard.getHits());
			request.setAttribute("email", ideaBoard.getEmail());
			request.setAttribute("write_date", ideaBoard.getWriteDate());
			request.setAttribute("name", ideaBoard.getName());
		} else {
			System.out.println("BoardController getBoard 메서드 Null error");
			return 0;
		}
		if(category.equals("it") || category.equals("market")||category.equals("media")||category.equals("etc")) {
			int hits = boardService.updateHits(businessBoardsIdx);
	         request.setAttribute("hits", hits);
	         request.setAttribute("category", category);
	         System.out.println("hits: " + hits);
			if (!session.getAttribute("name").equals(ideaBoard.getName())) {
				request.getRequestDispatcher("insideBoardOthers.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("insideBoardMy.jsp").forward(request, response);
		} 
		} else if(category.equals("myIdea")) {
			if(session.getAttribute("name").equals(ideaBoard.getName())) {
				request.getRequestDispatcher("insideBoardMy.jsp").forward(request, response);
			}
		} else if(category.equals("myTips")) {
			if(session.getAttribute("name").equals(ideaBoard.getName())) {
				request.getRequestDispatcher("tipBoardMy.jsp").forward(request, response);
			} 
		}else if(category.equals("tips")) {
			if(session.getAttribute("name").equals(ideaBoard.getName())) {
				request.getRequestDispatcher("tipBoardMy.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("tipBoardOthers.jsp").forward(request, response);
			}
				
		} else if(category.equals("select")) {
			if(session.getAttribute("name").equals(ideaBoard.getName())) {
				request.getRequestDispatcher("insideBoardOthers.jsp").forward(request, response);
			} 
		} else {
			System.out.println("BoardController getBoard 메서드 category null error");
			return 0;
		}
		return businessBoardsIdx;
	}
    /**
     * tip board 가져오기
     * @param request
     * @param response
     * @return
     * @throws ServletException
     * @throws IOException
     */
    protected int getTipBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		HttpSession session = request.getSession(false);
		int tipBoardsIndex = Integer.parseInt(request.getParameter("boardIndex"));	
		System.out.println("Board Controller ::: getTipBoard"+tipBoardsIndex);
		TipIdeaBoard tipBoard = boardService.getTipBoard(tipBoardsIndex);
		if (tipBoard != null) {
			request.setAttribute("tipBoardsIndex", tipBoardsIndex);
			request.setAttribute("title", tipBoard.getTitle());
			request.setAttribute("content", tipBoard.getTitle());
			request.setAttribute("result", tipBoard.getResult());
			request.setAttribute("files", tipBoard.getFiles());
			request.setAttribute("hits", tipBoard.getHits());
			request.setAttribute("scraps", tipBoard.getScraps());
			request.setAttribute("email", tipBoard.getEmail());
			request.setAttribute("write_date", tipBoard.getWriteDate());
			request.setAttribute("name", tipBoard.getName());
		} else {
			System.out.println("BoardController getTipBoard 메서드 Null error");
			return 0;
		}
		
		if(category.equals("myTips")) {
			if(!session.getAttribute("name").equals(tipBoard.getName())) {
				request.getRequestDispatcher("myIdea.jsp").forward(request, response);
			} 
		} else if(category.equals("tips")) {
			if(!session.getAttribute("name").equals(tipBoard.getName())) {
				System.out.println("tipBoard Tip 받기");
				request.getRequestDispatcher("coolTips.jsp").forward(request, response);
			} 
		} else {
			System.out.println("BoardController getBoard 메서드 category null error");
			return 0;
		}
		return tipBoardsIndex;
	}
    /**
     * 로그인 유무 확인 메서드
     * 보안처리
     * @param request
     * @param response
     * @return
     */
    private boolean isLoginMember(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false) ;
		if(session != null && session.getAttribute("name")!= null) {
			return true;
		}
		return false;
	}
  /**
   * 에러 처리
   * @param request
   * @param response
   * @param valueName
   * @param message
   * @return
   * @throws ServletException
   * @throws IOException
   */
    protected boolean errorGenerate(HttpServletRequest request, HttpServletResponse response, String valueName, String message) throws ServletException, IOException {
		if(valueName == null || valueName.trim().length() == 0) {
			System.out.println("errorGenerate function");
			request.setAttribute("message", message);
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return false;
		}
		return true;
	}
    
	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		process(request, response);
	}

}
