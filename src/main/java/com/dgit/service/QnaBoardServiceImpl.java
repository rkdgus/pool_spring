package com.dgit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dgit.domain.QnaBoardVO;
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
	public List<QnaBoardVO> selectByAll(int page) {
		return dao.selectByAll(page);
	}

	@Override
	public QnaBoardVO read(int bno) {		
		return dao.read(bno);
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
	public int countByAll() {
		return dao.countByAll();
	}

}
