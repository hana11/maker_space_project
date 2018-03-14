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
     * �⺻ ������
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
				System.out.println("\n## ���� �غ����Դϴ�. �������� �ʴ� �����Դϴ�.");
				break;
		}	
		} catch(NullPointerException e){
			e.printStackTrace();
		} finally {
			
		}
	}
    /**
     * �� ä�� ����
     * 
     * @param request
     * @param response
     */
 	
	private void select(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## �� ä�� ��û ����");
		
		if (!isLoginMember(request, response)) {
			System.out.println("�α��� ���ּ���");
			PrintWriter out = response.getWriter();
			response.resetBuffer();
			response.setContentType("text/html;charset=euc-kr");
			out.println("<script language='javascript'>");
			out.print("alert(\"");
			out.print("ȸ�� ���� �����Դϴ�. ȸ������ �� �̿����ּ���.");
			out.println("\");");
			out.println("history.go(-1)");
			out.println("</script>");
			response.flushBuffer();
			return ;
		}
		
		String category = request.getParameter("category");
		System.out.println("businessIndex : "+request.getParameter("businessBoardsIdx"));
		int boardIdx = Integer.parseInt(request.getParameter("businessBoardsIdx"));
		
		System.out.println(" ä�� ����  ��Ʈ�ѷ� :: boardIdx : " + boardIdx);
		
		if (boardIdx == 0) {
			System.out.println("�����ε���  0");
			return;
		}
		
		int isResult = boardService.registerMySelect(category,boardIdx);
		if (isResult != 0) {
			System.out.println("�� ä�� ����");
			//request.getRequestDispatcher("myProcess.jsp").forward(request, response);
			PrintWriter out = response.getWriter();
		      response.resetBuffer();
		      response.setContentType("text/html;charset=euc-kr");
		      out.println("<script language='javascript'>");
		      out.print("alert(\"");
		      out.print("ä�� �Ǿ����ϴ�.");
		      out.println("\");");
		      out.println("history.go(-1)");
		      out.println("</script>");
		      response.flushBuffer();
			
		} else {
			System.out.println("�� ä�� ����");
			request.setAttribute("message", "�̹� ���Ե� ȸ���Դϴ�.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/**
     * �۾��� ����
     */
    protected void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## �۾��� ��û ����");
		HttpSession session = request.getSession(false);
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String result = request.getParameter("result");
		String files = request.getParameter("files");
		String[] hashTag = request.getParameterValues("hashTag");
		String email = (String)session.getAttribute("email");
		int businessBoardsIdx, tipBoardIdx;
		if(errorGenerate(request, response, title, "������ �Է����ּ���!") != true ) {
			return;
		}
		if(errorGenerate(request, response, content, "��й�ȣ�� �Է����ּ���!") != true) {
			return;
		}
		if(errorGenerate(request, response, result, "���̵� �Է����ּ���!") != true) {
			return;
		}
		 if (errorGenerate(request, response, title, "������ �Է����ּ���!") != true) {
	         return;
	      }
	      if (errorGenerate(request, response, content, "��й�ȣ�� �Է����ּ���!") != true) {
	         return;
	      }
	      if (errorGenerate(request, response, result, "���̵� �Է����ּ���!") != true) {
	         return;
	      }
	      if (category.equals("it")) {
	         businessBoardsIdx = boardService.businessWrite("it", new IdeaBoard(title, content, result, files, 0, email,
	               MyUtility.dateGenerator(), (String) session.getAttribute("name")));
	         if (businessBoardsIdx != 0) {
	            System.out.println("BoardService it boards �۾��� ����");
	            boardService.businssRegisterHashTag(businessBoardsIdx, hashTag);
	            getBoards(request, response);
	         } else {
	            System.out.println("BoardService it boards �۾��� ����");
	            request.setAttribute("message", "�� ���⿡ ������ ������ϴ�!");
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	         }
	      } else if (category.equals("market")) {
	         businessBoardsIdx = boardService.businessWrite("market", new IdeaBoard(title, content, result, files, 0,
	               email, MyUtility.dateGenerator(), (String) session.getAttribute("name")));
	         if (businessBoardsIdx != 0) {
	            System.out.println("BoardService market boards �۾��� ����");
	            boardService.businssRegisterHashTag(businessBoardsIdx, hashTag);
	            getBoards(request, response);
	         } else {
	            System.out.println("BoardService market boards �۾��� ����");
	            request.setAttribute("message", "�� ���⿡ ������ ������ϴ�!");
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	         }
	      } else if (category.equals("media")) {
	         businessBoardsIdx = boardService.businessWrite("media", new IdeaBoard(title, content, result, files, 0,
	               email, MyUtility.dateGenerator(), (String) session.getAttribute("name")));
	         if (businessBoardsIdx != 0) {
	            System.out.println("BoardService media boards �۾��� ����");
	            boardService.businssRegisterHashTag(businessBoardsIdx, hashTag);
	            getBoards(request, response);
	         } else {
	            System.out.println("BoardService it boards �۾��� ����");
	            request.setAttribute("message", "�� ���⿡ ������ ������ϴ�!");
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	         }
	      } else if (category.equals("etc")) {
	         businessBoardsIdx = boardService.businessWrite("etc", new IdeaBoard(title, content, result, files, 0, email,
	               MyUtility.dateGenerator(), (String) session.getAttribute("name")));
	         if (businessBoardsIdx != 0) {
	            System.out.println("BoardService etc boards �۾��� ����");
	            boardService.businssRegisterHashTag(businessBoardsIdx, hashTag);
	            getBoards(request, response);
	         }
	
		} /*else if (category.equals("tips")) {
			System.out.println("������Ʈ�ѷ� ���Լ���");
			tipBoardIdx = boardService.tipWrite(category, new TipIdeaBoard(title, content, result, files, 0,
			email, MyUtility.dateGenerator(),  0, (String) session.getAttribute("name")));
			System.out.println("��Ʈ�ѷ� TIP IDX :: " +tipBoardIdx);
			boardService.myTipWrite(category, tipBoardIdx);
			
			if (tipBoardIdx != 0) {
				System.out.println("tipBoards �۾��� ����");
				boardService.businssRegisterHashTag(tipBoardIdx, hashTag);
				
			} else {
				System.out.println("tipBoards �۾��� ����");
				request.setAttribute("message", "�� ���⿡ ������ ������ϴ�!");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}*/
		
	}
    
    /**
     * ���� �۰˻� ����
     */
    protected void findTitle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## ����۰˻� ��û ����");
		String title = request.getParameter("title");
		
		System.out.println("title: " + title +"//");
		
		if(errorGenerate(request, response, title, "�˻�� �Է����ּ���!") != true ) {
			return;
		}
		
		ArrayList<IdeaBoard> ideaBoards = boardService.businessFindByTitle(title);
		if(ideaBoards != null) {
			System.out.println("�۰˻� ����");
			request.setAttribute("ideaBoards", ideaBoards);
			request.getRequestDispatcher("search.jsp").forward(request, response);
		} else {
			System.out.println("�۰˻� ����");
			request.setAttribute("message", "�ش�Ǵ� �˻��� �����ϴ�.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
    /**
     * �ۻ��� ����
     */
    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## �ۻ��� ��û ����");
		HttpSession session = request.getSession(false);
		String email;
		if (session != null) {
			email = (String) session.getAttribute("email");
		} else {
			email = null;
		}
		int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
		if(boardIdx == 0) {
			System.out.println("�����ε���  0");
			return;
		}
		if(email == null) {
			System.out.println("email null");
			return;
		}
		int isResult = boardService.businessDelete(boardIdx);
		if(isResult != 0) {
			System.out.println("�ۻ��� ����");
			request.getRequestDispatcher("mainService.jsp").forward(request, response);
		} else {
			System.out.println("�ۻ��� ����");
			request.setAttribute("message", "�̹� ���Ե� ȸ���Դϴ�.");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
    /**
     * ������ Boards ��������
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void getBoards(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## getBoards ��û ����");
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
		System.out.println("\n## Board controller :: getTipBoards ��û ����");
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
     * ������ Boards ��������
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
			System.out.println("BoardController getBoard �޼��� Null error");
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
			System.out.println("BoardController getBoard �޼��� category null error");
			return 0;
		}
		return businessBoardsIdx;
	}
    /**
     * tip board ��������
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
			System.out.println("BoardController getTipBoard �޼��� Null error");
			return 0;
		}
		
		if(category.equals("myTips")) {
			if(!session.getAttribute("name").equals(tipBoard.getName())) {
				request.getRequestDispatcher("myIdea.jsp").forward(request, response);
			} 
		} else if(category.equals("tips")) {
			if(!session.getAttribute("name").equals(tipBoard.getName())) {
				System.out.println("tipBoard Tip �ޱ�");
				request.getRequestDispatcher("coolTips.jsp").forward(request, response);
			} 
		} else {
			System.out.println("BoardController getBoard �޼��� category null error");
			return 0;
		}
		return tipBoardsIndex;
	}
    /**
     * �α��� ���� Ȯ�� �޼���
     * ����ó��
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
   * ���� ó��
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
