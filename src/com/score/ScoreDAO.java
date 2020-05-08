package com.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

//CRUD : Create(insert),Retrieve(select),Update,Delete
public class ScoreDAO {
	private Connection conn = DBConn.getConnection();

	public int insertScore(ScoreDTO dto) throws Exception {
		int result = 0;
		PreparedStatement pstmt = null; // 쿼리 처리할때 preparedStatement 등.. 사용
		String sql;

		try {
			sql = "INSERT INTO score(hak,name,birth,kor,eng,mat)VALUES(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getHak());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getBirth());
			pstmt.setInt(4, dto.getKor());
			pstmt.setInt(5, dto.getEng());
			pstmt.setInt(6, dto.getMat());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return result;
	}

	// list
	public List<ScoreDTO> listScore() {
		List<ScoreDTO> list = new ArrayList<ScoreDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();

		try {
			sb.append("SELECT hak,name,birth,kor,eng,mat,(kor+eng+mat)tot,(kor+eng+mat)/3 ave,");
			sb.append(" RANK()OVER(ORDER BY(kor+eng+mat)DESC)rank");
			sb.append(" FROM score");

			pstmt = conn.prepareStatement(sb.toString());

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ScoreDTO dto = new ScoreDTO();
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getDate("birth").toString());
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				dto.setRank(rs.getInt("rank"));

				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return list;
	}

//삭제	
	public int deleteScore(String hak) throws Exception {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "DELETE FROM score WHERE hak=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return result;
	}

//체크박스 삭제	
	public int deleteListScore(String[] haks) throws Exception {
		int result = 0;
		PreparedStatement pstmt = null;
	//	StringBuilder sb = new StringBuilder();
		String sql;

		try {
			sql = "DELETE FROM score WHERE hak IN( ?";
		//	pstmt = conn.prepareStatement(sql);

			for (int i = 1; i < haks.length; i++) {
				sql+=",?";
			}
			sql+=")";
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < haks.length; i++) {
				pstmt.setString(i+1, haks[i]);
			}
			
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return result;
	}

	// 학번 검색
	public ScoreDTO readScore(String hak) {
		ScoreDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT hak,name,birth,name,kor,eng,mat FROM score WHERE hak=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new ScoreDTO();
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getDate("birth").toString());
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e2) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return dto;
	}

	public int updateScore(ScoreDTO dto) throws Exception {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "UPDATE score SET name=?,birth=?,kor=?,eng=?,mat=? WHERE hak=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getBirth());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());
			pstmt.setString(6, dto.getHak());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e2) {
				}
			}
		}
		return result;
	}
}