package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *	DAO : Data Access Object, 데이터 처리 객체 
 *	 => DB데이터,Mysql과 관련된 모든 처리를 수행하는 객체
 *
 *  DTO : Data Transfer Object, 데이터 전송 객체
 *   => 자바빈객체 / VO
 *   => DB에 저장된 데이터를 한번에 저장하는 객체 
 */
public class BoardDAO {
	
	// 공통 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";		
	
	/**
	 *	 getConnection() 
	 *   BoardDAO 객체 안에서만 사용가능한 메서드
	 *   디비 연결에 관한 동작 모두 처리
	 * @throws ClassNotFoundException 
	 */
	// 디비연결처리 메서드-getConnection()
	private Connection getConnection() throws Exception {
		// 디비연결정보
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println(" DAO : 드라이버 로드 성공!");
		// 2. 디비 연결
		con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println(" DAO : 디비 연결 성공! ");
		System.out.println(" DAO : "+con);
		
		return con;
	}
	// 디비연결처리 메서드-getConnection()
	
	
	
	// 글정보 저장 메서드 - insertBoard()
	public void insertBoard(BoardBean bb) {
		// 디비연결정보
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		int bno = 0;
		try {
			// 1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println(" DAO : 드라이버 로드 성공!");
			// 2. 디비 연결
			Connection con 
			  = DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println(" DAO : 디비 연결 성공! ");
			
			// 3. SQL구문 & pstmt 객체
			// -> 글번호 계산
			String sql ="select max(bno) from itwill_board";
			
			PreparedStatement pstmt 
			    = con.prepareStatement(sql);
			
			// 4. sql 실행
			ResultSet rs = pstmt.executeQuery();
			
			// 5. 데이터처리
			if(rs.next()) {
				//System.out.println("ttttttttttttt");
				//bno = rs.getInt("bno")+1; (x)
				//bno = rs.getInt("max(bno)")+1; // 컬럼명
				bno = rs.getInt(1)+1; // 컬럼인덱스-첫번째 요소조회
				// => getInt() 리턴값이 SQL-null일때 0을 리턴
			}
			
			System.out.println(" DAO :   bno:"+bno);
			
			// 3. SQL구문(insert) & pstmt 객체
			sql 
			  ="insert into itwill_board(bno,name,pass,subject,content,readcount,"
			  		+ "re_ref,re_lev,re_seq,date,ip,file) values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			
			// ????
			pstmt.setInt(1, bno);  // 계산한 글번호
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			
			pstmt.setInt(6, 0); // 조회수 0
			pstmt.setInt(7, bno); // bno == re_ref (신규글)
			pstmt.setInt(8, 0);  //re_lev 0 (신규글)
			pstmt.setInt(9, 0);  //re_seq 0 (신규글)
			
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			// 4. SQL 실행
			pstmt.executeUpdate();
			System.out.println(" DAO : 글쓰기 완료! ");
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}		
	
		
	}
	// 글정보 저장 메서드 - insertBoard()
	
	
	// 글 개수 계산 메서드 - getBoardCount()
	public int getBoardCount() {
		int result = 0;
		
		//디비연결정보
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		try {
			//1. 드라이버 로드
			Class.forName(DRIVER);
			System.out.println(" DAO : 드라이버로드 성공! ");
			//2. 디비 연결
			Connection con =
			  DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println(" DAO : 디비연결 성공! ");
			
			//3. sql 작성(select) & pstmt 객체
			String sql = "select count(*) from itwill_board";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			//4. sql 실행
			ResultSet rs= pstmt.executeQuery();
			//5. 데이터 처리 - 개수를 저장		
			if(rs.next()) {
				result = rs.getInt(1);
				//result = rs.getInt("count(*)");
			}
			
			System.out.println(" DAO : 개수 "+result+"개");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return result;
	}
	// 글 개수 계산 메서드 - getBoardCount()
	
	// 글 정보 목록을 가져오는 메서드 - getBoardList()
	public ArrayList getBoardList(){
		// 글정보를 저장하는 배열
		ArrayList boardList = new ArrayList();
		try {
			// 디비연결정보		
			// 1. 드라이버 로드
			// 2. 디비 연결
			con = getConnection();
			// 3. SQL 작성(select) & pstmt 객체
			//sql = "select * from itwill_board order by re_ref desc";
			sql = "select * from itwill_board order by bno desc";
//			sql = "select * from itwill_board order by bno desc limit 0,10";
			pstmt = con.prepareStatement(sql);
			// 4. SQL 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			//  글정보 전부 가져오기
			//  BoardBean 객체 여러개 => ArrayList 저장
			while(rs.next()) {
				//  글 하나의 정보 => BoardBean저장
				BoardBean bb = new BoardBean();
				
				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				
				// 글 하나의 정보를 배열의 한칸에 저장
				boardList.add(bb);
				
			}// while
			
			System.out.println(" DAO : 게시판 글 목록 조회성공! ");
			System.out.println(" DAO : "+boardList.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}	
	// 글 정보 목록을 가져오는 메서드 - getBoardList()
	
	// 글 정보 목록을 가져오는 메서드 - getBoardList(int startRow,int pageSize)
	public ArrayList getBoardList(int startRow,int pageSize){
		// 글정보를 저장하는 배열
		ArrayList boardList = new ArrayList();
		try {
			// 디비연결정보		
			// 1. 드라이버 로드
			// 2. 디비 연결
			con = getConnection();
			// 3. SQL 작성(select) & pstmt 객체
			//sql = "select * from itwill_board order by bno desc limit ?,?";
			sql = "select * from itwill_board order by re_ref desc,re_seq asc limit ?,?";
			pstmt = con.prepareStatement(sql);
			// ????
			pstmt.setInt(1, startRow-1); //시작행번호-1 
			pstmt.setInt(2, pageSize); //개수
			// 4. SQL 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			//  글정보 전부 가져오기
			//  BoardBean 객체 여러개 => ArrayList 저장
			while(rs.next()) {
				//  글 하나의 정보 => BoardBean저장
				BoardBean bb = new BoardBean();
				
				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				
				// 글 하나의 정보를 배열의 한칸에 저장
				boardList.add(bb);
				
			}// while
			
			System.out.println(" DAO : 게시판 글 목록 조회성공! ");
			System.out.println(" DAO : "+boardList.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}	
	// 글 정보 목록을 가져오는 메서드 -getBoardList(int startRow,int pageSize)
	
	
	// 해당글 조회수 1증가 - updateReadCount()
	public void updateReadCount(int bno) {
	
		try {
			// 1.2. 디비연결
			con = getConnection();
			// 3. SQL작성 & pstmt 객체
			// 특정 글의 조회수를 1증가
			sql = "update itwill_board set readcount=readcount + 1 where bno = ?";
			pstmt = con.prepareStatement(sql);
			// ????
			pstmt.setInt(1, bno);			
			// 4. SQL 실행
			pstmt.executeUpdate();
			
			System.out.println(" DAO : 게시판 조회수 1증가 완료! ");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	// 해당글 조회수 1증가 - updateReadCount()
	
	// 특정 번호에 해당하는 글정보를 가져오기 - getBoard(bno);
	public BoardBean getBoard(int bno) {
		//BoardBean bb;
//		System.out.println(bb.getBno());
		// => 컴파일 에러
		BoardBean bb = null;
		//System.out.println(bb.getBno());
		// => 예외 발생
		try {
			// 1.2. 디비연결
			con = getConnection();
			// 3. sql작성(select) & pstmt 객체
			sql = "select * from itwill_board where bno=?";
			pstmt = con.prepareStatement(sql);
			// ???
			pstmt.setInt(1, bno);
			// 4. sql실행
			rs = pstmt.executeQuery();
			// 5. 데이터처리 (rs->BoardBean)
			if(rs.next()) {
				bb = new BoardBean();
				
				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
			}
			System.out.println(" DAO : 글정보 저장완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bb;
	}	
	// 특정 번호에 해당하는 글정보를 가져오기 - getBoard(bno);
	
	// 게시판 글 수정하기 - updateBoard(bb)
	public int updateBoard(BoardBean bb) {
		int result = -1; // -1  0   1
		
		try {
			// 1.2. 디비연결
			con = getConnection();
			// 3. sql 작성 & pstmt 객체
			sql = "select pass from itwill_board where bno = ?";
			pstmt = con.prepareStatement(sql);
			// ???
			pstmt.setInt(1, bb.getBno());
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				// 게시판 글있음
				if(bb.getPass().equals(rs.getString("pass"))) {
					//  게시판 글있음 - 비밀번호 같음
					//  => 글 수정
					
					//3. sql 작성 & pstmt 객체
					sql = "update itwill_board set name=?,subject=?,content=? where bno=?";
					pstmt = con.prepareStatement(sql);
					
					//???
					pstmt.setString(1, bb.getName());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setInt(4, bb.getBno());
					
					// 4. sql 실행
					result = pstmt.executeUpdate();
					//=> SQL구문(insert,update,delete)이 몇줄 영향을 미치는가를 정수형태로 리턴
					System.out.println(" DAO : 게시판 글 수정 완료! ");
					System.out.println(" DAO : result : "+result);
					
					// 수정완료값 저장
					//result = 1;
					
				}else {
					//  게시판 글있음 - 비밀번호 다름 0
					result = 0;
				}
				
			}else {
				// 게시판 글없음  -1
				result = -1;
			}
			
			System.out.println(" DAO : 글 수정처리 완료 "+result);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	// 게시판 글 수정하기 - updateBoard(bb)
	
	
	// 글삭제 메서드-deleteBoard(bb)
	public int deleteBoard(BoardBean bb) {
		int result = -1;
		
		try {
			//1.2. 디비연결
			con = getConnection();
			//3. sql 작성 & pstmt 객체
			sql = "select pass from itwill_board where bno =?";
			pstmt = con.prepareStatement(sql);
			// ???
			pstmt.setInt(1, bb.getBno());
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터처리
			if(rs.next()) {
				if(bb.getPass().equals(rs.getString("pass"))) {
					//3. sql 작성(delete) &pstmt
					sql = "delete from itwill_board where bno=?";
					pstmt = con.prepareStatement(sql);
					// ???
					pstmt.setInt(1, bb.getBno());
					//4. sql 실행
					result = pstmt.executeUpdate();
				}else {
					result = 0;
				}
			}else {
				result = -1;
			}
			
			System.out.println(" DAO : 글삭제 완료! "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 글삭제 메서드-deleteBoard(bb)
	
    // 답글 쓰기 메서드 - reInsertBoard(bb)
	public void reInsertBoard(BoardBean bb) {
		int bno = 0;
		
		try {
			/*****************1. 답글번호(bno) 계산 **********************/
			// 1.2. 디비연결
			con = getConnection();
			// 3. sql 작성 & pstmt 객체
			sql = "select max(bno) from itwill_board";
			pstmt = con.prepareStatement(sql);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터처리
			if(rs.next()) {
				//bno = rs.getInt(1)+1;
				bno = rs.getInt("max(bno)")+1;
			}
			System.out.println(" DAO : 답글bno "+bno);
			/*****************1. 답글번호(bno) 계산 **********************/
			
			/*****************2. 답글seq 계산 (기존값보다 큰게 있는지) **********************/
			// => 답글순서 재배치 (같은 그룹의 글 중에서 기존의 seq보다 큰값이 존재하는 경우 +1)
			// 3. sql작성 & pstmt 객체
			sql = "update itwill_board set re_seq = re_seq + 1 where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(sql);
			
			// ??? 
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			
			// 4. sql 실행
			int tmp = pstmt.executeUpdate();
			if(tmp >= 1) {
				System.out.println(" DAO : 답글 순서 재배치 완료! ("+tmp+"개)");
			}
			
			/*****************2. 답글seq 계산 (기존값보다 큰게 있는지) **********************/
			
			
			/*****************3. 나머지 정보 사용 글쓰기 (ref,lev,seq계산) **********************/
			// => insertBoard 참고 (ref,lev,seq 로직값 설정)
			// 3. sql 작성(insert) & pstmt 객체
			sql = "insert into itwill_board (bno,name,pass,subject,content,readcount,"
					+ "re_ref,re_lev,re_seq,date,ip,file) values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			
			// ???
			pstmt.setInt(1, bno);  // 답글번호 (계산한값)
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setInt(7, bb.getRe_ref()); // re_ref => 원글의 ref값 사용
			pstmt.setInt(8, bb.getRe_lev()+1); // re_lev => 원글의 lev + 1
			pstmt.setInt(9, bb.getRe_seq()+1); // re_seq => 원글의 seq + 1
			
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			// 4. sql 실행
			pstmt.executeUpdate();			
			
			/*****************3. 나머지 정보 사용 글쓰기 (ref,lev,seq계산) **********************/
			
			System.out.println(" DAO : 답글 작성완료! ");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	// 답글 쓰기 메서드 - reInsertBoard(bb) 	
	
	

}// DAO
