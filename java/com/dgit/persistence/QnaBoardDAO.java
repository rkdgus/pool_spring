package com.dgit.persistence;


import java.util.List;
import com.dgit.domain.QnaBoardVO;

public interface QnaBoardDAO {
	public List<QnaBoardVO>selectByAll(int page);
	public QnaBoardVO read(int bno);
	public void insert(QnaBoardVO vo);
	public void update(QnaBoardVO vo);
	public void delete(int bno);
	public int countByAll();
	public void answerUpdate(QnaBoardVO vo);
}
 