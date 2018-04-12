package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.QnaBoardVO;
import com.dgit.domain.SearchCriteria;
import com.dgit.persistence.QnaBoardDAO;
@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	public static final QnaBoardServiceImpl instance = new QnaBoardServiceImpl();
	
	private QnaBoardServiceImpl() {}

	public static QnaBoardServiceImpl getInstance() {
		return instance;
	}

	@Autowired
	private QnaBoardDAO dao;
	 
	@Override
	public List<QnaBoardVO> selectByAll(SearchCriteria cri) {
		return dao.selectByAll(cri);
	}

	@Override
	public QnaBoardVO read(int bno,String pw) {		
		return dao.read(bno,pw);
	}

	@Override
	public void create(QnaBoardVO vo) {
		dao.insert(vo);

	}

	@Override
	public void modify(QnaBoardVO vo) {
		dao.update(vo);
	}

	@Override
	public void remove(int bno) {
		dao.delete(bno);
	}

	@Override
	public void modifyAnswer(QnaBoardVO vo) {
		dao.answerUpdate(vo);
	}

	@Override
	public int countByAll(SearchCriteria cri) {
		return dao.countByAll(cri);
	}

	@Override
	public QnaBoardVO selectByBno(int bno) {
		return dao.selectByBno(bno);
	}

	@Override
	public void answerUpdate(QnaBoardVO vo) {
		dao.answerUpdate(vo);
		
	}

	@Override
	public List<QnaBoardVO> selectbyIdQna(String id, SearchCriteria cri) {
		return dao.selectbyIdQna(id, cri);
	}

	@Override
	public int selectbyIdCount(String id) {
		return dao.selectbyIdCount(id);
	}

}
