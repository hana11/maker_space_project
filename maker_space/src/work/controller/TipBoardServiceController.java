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
     * �⺻ ������
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
					System.out.println("\n## ���� �غ����Դϴ�. �������� �ʴ� �����Դϴ�.");
					break;
					
			}
			
			
		} catch(NullPointerException e){
			e.printStackTrace();
		} finally {
			
		}
	}
    /**
     * ���� ���忡�� ��ũ�� �ϴ� �޼���
     * @param request
     * @param response
     * @throws IOException 
     * @throws ServletException 
     */
    
	private void scrap(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println("\n## �� ��ũ�� ��û ����");
		if (!isLoginMember(request, response)) {
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
		int tipIdx = Integer.parseInt(request.getParameter("tip_idx"));
		System.out.println(" ��ũ�� ����  ��Ʈ�ѷ� :: boardIdx : " + tipIdx);
		if (tipIdx == 0) {
			System.out.println("�����ε���  0");
			return;
		}
		
		int isResult = tipBoardService.registerMyScraps(category, tipIdx);
		if (isResult != 0) {
			System.out.println("�� ä�� ����");
			//request.getRequestDispatcher("myProcess.jsp").forward(request, response);
			PrintWriter out = response.getWriter();
		      response.resetBuffer();
		      response.setContentType("text/html;charset=euc-kr");
		      out.println("<script language='javascript'>");
		      out.print("alert(\"");
		      out.print("��ũ�� �Ǿ����ϴ�.");
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
	private int getTipBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		HttpSession session = request.getSession(false);
		int tipBoardsIndex = Integer.parseInt(request.getParameter("tipBoardsIndex"));	
		System.out.println("tipBoardIdx ::::: "+tipBoardsIndex);
		TipIdeaBoard tipBoard = tipBoardService.getTipBoard(tipBoardsIndex);
		System.out.println("tipBoard ����:: "+tipBoard.toString());
		
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
			if(session.getAttribute("name").equals(tipBoard.getName())) {
				request.getRequestDispatcher("myTips.jsp").forward(request, response);
			} 
		} else if(category.equals("tips")) {
			System.out.println(">>>> tipBoardIndex" + tipBoardsIndex);
			if(session.getAttribute("name").equals(tipBoard.getName())) {
				System.out.println("�������� ��������");
				request.getRequestDispatcher("coolTips.jsp").forward(request, response);
			} 
		} else {
			System.out.println("BoardController getBoard �޼��� category null error");
			return 0;
		}
		return tipBoardsIndex;
	}
	private void getTipBoards(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("\n## getTipBoards ��û ����");
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
		System.out.println("\n## �۾��� ��û ����");
		HttpSession session = request.getSession(false);
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String result = request.getParameter("result");
		String files = request.getParameter("files");
		String[] hashTag = request.getParameterValues("hashTag");
		String email = (String)session.getAttribute("email");
		int tipBoardIdx;
		if(errorGenerate(request, response, title, "������ �Է����ּ���!") != true ) {
			return;
		}
		if(errorGenerate(request, response, content, "��й�ȣ�� �Է����ּ���!") != true) {
			return;
		}
		if(errorGenerate(request, response, result, "���̵� �Է����ּ���!") != true) {
			return;
		}
		if (category.equals("tips")) {
			//(String title, String content, String result, String files, int hits, String email,String writeDate, String name, int scraps)
			tipBoardIdx = tipBoardService.tipWrite(category, new TipIdeaBoard(title, content, result, files, 0, email, MyUtility.dateGenerator(), (String) session.getAttribute("name"), 0));
			getTipBoards(request, response);
			System.out.println("tipBoardIDx ::: "+ tipBoardIdx);
			if (tipBoardIdx != 0) {
				System.out.println("tipBoards �۾��� ����");
				tipBoardService.businssRegisterHashTag(tipBoardIdx, hashTag);
				
			} else {
				System.out.println("tipBoards �۾��� ����");
				request.setAttribute("message", "�� ���⿡ ������ ������ϴ�!");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
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
