package work.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work.model.dto.IdeaBoard;
import work.model.dto.TipIdeaBoard;
import work.model.service.BoardService;
import work.util.MyUtility;

/**
 * Servlet implementation class TipBoardServiceController
 */
public class TipBoardServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BoardService tipBoardService; 
    /**
     * 기본 생성자
     */
    public TipBoardServiceController() {
    		tipBoardService = BoardService.getInstance();
	}
    protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String action = request.getParameter("action");
			System.out.println("Tip controller process action :" +action);
			switch(action) {
				case "write" :
					write(request, response);
					break;
				case "getTipBoards" :
					getTipBoards(request, response);
					break;
				case "getTipBoard" :
					getTipBoard(request, response);
					break;
				case "scrap" :
					scrap(request, response);
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
     * 꿀팁 보드에서 스크랩 하는 메서드
     * @param request
     * @param response
     * @throws IOException 
     * @throws ServletException 
     */
    
	private void scrap(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("\n## 글 스크랩 요청 서비스");
		if (!isLoginMember(request, response)) {
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
		int tipIdx = Integer.parseInt(request.getParameter("tip_idx"));
		System.out.println(" 스크랩 서비스  컨트롤러 :: boardIdx : " + tipIdx);
		if (tipIdx == 0) {
			System.out.println("보드인덱스  0");
			return;
		}
		
		int isResult = tipBoardService.registerMyScraps(category, tipIdx);
		if (isResult != 0) {
			System.out.println("글 채택 성공");
			//request.getRequestDispatcher("myProcess.jsp").forward(request, response);
			PrintWriter out = response.getWriter();
		      response.resetBuffer();
		      response.setContentType("text/html;charset=euc-kr");
		      out.println("<script language='javascript'>");
		      out.print("alert(\"");
		      out.print("스크랩 되었습니다.");
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
	private int getTipBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		HttpSession session = request.getSession(false);
		int tipBoardsIndex = Integer.parseInt(request.getParameter("tipBoardsIndex"));	
		System.out.println("tipBoardIdx ::::: "+tipBoardsIndex);
		TipIdeaBoard tipBoard = tipBoardService.getTipBoard(tipBoardsIndex);
		System.out.println("tipBoard 정보:: "+tipBoard.toString());
		
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
			if(session.getAttribute("name").equals(tipBoard.getName())) {
				request.getRequestDispatcher("myTips.jsp").forward(request, response);
			} 
		} else if(category.equals("tips")) {
			System.out.println(">>>> tipBoardIndex" + tipBoardsIndex);
			if(session.getAttribute("name").equals(tipBoard.getName())) {
				System.out.println("꿀팁으로 보내버려");
				request.getRequestDispatcher("coolTips.jsp").forward(request, response);
			} 
		} else {
			System.out.println("BoardController getBoard 메서드 category null error");
			return 0;
		}
		return tipBoardsIndex;
	}
	private void getTipBoards(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## getTipBoards 요청 서비스");
		HttpSession session = request.getSession(false);
		String email = session.getAttribute("email").toString();
		String category = request.getParameter("category");
		int page = 1;
		if (request.getParameter("page") != null && request.getParameter("page").trim().equals("") == false) {
			page = Integer.parseInt(request.getParameter("page"));
			System.out.println(">>>" + page);
		}	
		System.out.println("!!!!!!!!!!!!!!!!!");
		Map<String, Object> map = tipBoardService.getTipBoards(page, category, email);
		map.put("sessionName", session.getAttribute("name"));
		request.setAttribute("tipMap", map);
		
		if(category.equals("myTips")) {
			request.getRequestDispatcher("myTips.jsp").forward(request, response);
		} else if(category.equals("tips")) {
			request.getRequestDispatcher("coolTips.jsp").forward(request, response);
		}
		return;
		
	}
	private void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## 글쓰기 요청 서비스");
		HttpSession session = request.getSession(false);
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String result = request.getParameter("result");
		String files = request.getParameter("files");
		String[] hashTag = request.getParameterValues("hashTag");
		String email = (String)session.getAttribute("email");
		int tipBoardIdx;
		if(errorGenerate(request, response, title, "제목을 입력해주세요!") != true ) {
			return;
		}
		if(errorGenerate(request, response, content, "비밀번호를 입력해주세요!") != true) {
			return;
		}
		if(errorGenerate(request, response, result, "아이디를 입력해주세요!") != true) {
			return;
		}
		if (category.equals("tips")) {
			//(String title, String content, String result, String files, int hits, String email,String writeDate, String name, int scraps)
			tipBoardIdx = tipBoardService.tipWrite(category, new TipIdeaBoard(title, content, result, files, 0, email, MyUtility.dateGenerator(), (String) session.getAttribute("name"), 0));
			getTipBoards(request, response);
			System.out.println("tipBoardIDx ::: "+ tipBoardIdx);
			if (tipBoardIdx != 0) {
				System.out.println("tipBoards 글쓰기 성공");
				tipBoardService.businssRegisterHashTag(tipBoardIdx, hashTag);
				
			} else {
				System.out.println("tipBoards 글쓰기 실패");
				request.setAttribute("message", "글 쓰기에 오류가 생겼습니다!");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
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
