package spring.reserve.dao;

import java.util.List;

import spring.dto.ReserveDto;

public interface ReserveDaoInter {

	//���
	public int getTotalCount();
	public void inserReserve(ReserveDto dto);
	public ReserveDto getData(String num);
	public List<ReserveDto> getAllDatas();
	
	//����
	public void updateReserve(ReserveDto dto);
	public void deleteReserve(String num);
}
